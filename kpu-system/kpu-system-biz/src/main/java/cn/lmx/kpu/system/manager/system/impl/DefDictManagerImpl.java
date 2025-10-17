package cn.lmx.kpu.system.manager.system.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapBuilder;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.cache.redis2.CacheResult;
import cn.lmx.basic.cache.repository.CachePlusOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.echo.properties.EchoProperties;
import cn.lmx.basic.model.cache.CacheHashKey;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.kpu.common.cache.tenant.base.DictCacheKeyBuilder;
import cn.lmx.kpu.common.constant.DefValConstants;
import cn.lmx.kpu.model.enumeration.system.DictClassifyEnum;
import cn.lmx.kpu.model.enumeration.system.DictDataTypeEnum;
import cn.lmx.kpu.model.vo.result.Option;
import cn.lmx.kpu.system.entity.system.DefDict;
import cn.lmx.kpu.system.manager.system.DefDictManager;
import cn.lmx.kpu.system.mapper.system.DefDictMapper;
import cn.lmx.kpu.system.vo.result.system.DefDictItemResultVO;
import com.baidu.fsg.uid.UidGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.*;
import java.util.function.Function;

import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.toList;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@RequiredArgsConstructor
@Service
public class DefDictManagerImpl extends SuperManagerImpl<DefDictMapper, DefDict> implements DefDictManager {

    private final DefDictMapper defDictMapper;
    private final CachePlusOps cachePlusOps;
    private final EchoProperties ips;
    private final UidGenerator uidGenerator;

    @Override
    // 将枚举数据，同步存入字典表
    public void syncEnumToDict(Map<Option, List<Option>> ennumMap) {
        int sort = 1000;
        for (Map.Entry<Option, List<Option>> entry : ennumMap.entrySet()) {
            Option type = entry.getKey();

            boolean save = true;
            DefDict dict = super.getOne(Wraps.<DefDict>lbQ().eq(DefDict::getKey, type.getValue()).eq(DefDict::getParentId, DefValConstants.PARENT_ID));
            if (dict == null) {
                dict = new DefDict();
                dict.setClassify(DictClassifyEnum.SYSTEM.getCode());
                dict.setParentId(DefValConstants.PARENT_ID);
                dict.setKey(type.getValue());
                dict.setName(type.getLabel());
                dict.setState(true);
                dict.setSortValue(sort++);
                dict.setDataType(DictDataTypeEnum.STRING.getCode());
                dict.setId(uidGenerator.getUid());
            } else {
                save = false;
                dict.setName(type.getLabel());
            }

            List<Option> optionList = entry.getValue();

            List<DefDict> itemList = new ArrayList<>();
            int i = 1;
            for (Option option : optionList) {
                if (save) {
                    DefDict item = new DefDict();
                    item.setParentId(dict.getId())
                            .setParentKey(dict.getKey())
                            .setClassify(DictClassifyEnum.SYSTEM.getCode())
                            .setKey(option.getValue())
                            .setName(option.getLabel())
                            .setState(true)
                            .setPropType(type.getColor())
                            .setDataType(type.getRemark())
                            .setSortValue(dict.getSortValue() + i++)
                            .setCssClass(option.getColor());
                    itemList.add(item);
                } else {
                    DefDict item = super.getOne(Wraps.<DefDict>lbQ().eq(DefDict::getKey, option.getValue()).eq(DefDict::getParentId, dict.getId()));

                    if (item == null) {
                        item = new DefDict();
                        item.setParentId(dict.getId())
                                .setParentKey(dict.getKey())
                                .setClassify(DictClassifyEnum.SYSTEM.getCode())
                                .setKey(option.getValue())
                                .setName(option.getLabel())
                                .setPropType(type.getColor())
                                .setDataType(type.getRemark())
                                .setState(true)
                                .setSortValue(dict.getSortValue() + i++)
                                .setCssClass(option.getColor());
                        itemList.add(item);
                    }
                }
            }

            if (save) {
                save(dict);
            } else {
                updateById(dict);
            }
            saveBatch(itemList);
        }
    }

    @Override
    public Map<Serializable, DefDict> findByIds(Set<Serializable> dictKeys) {
        if (dictKeys.isEmpty()) {
            return Collections.emptyMap();
        }

        Map<Serializable, DefDict> codeValueMap = MapUtil.newHashMap();
        dictKeys.forEach(dictKey -> {
            Function<CacheKey, Map<String, DefDict>> fun = ck -> {
                LbQueryWrap<DefDict> wrap = Wraps.<DefDict>lbQ().eq(DefDict::getParentKey, dictKey);
                List<DefDict> list = defDictMapper.selectList(wrap);

                if (CollUtil.isNotEmpty(list)) {
                    return CollHelper.uniqueIndex(list, DefDict::getKey, item -> item);
                } else {
                    return MapBuilder.<String, DefDict>create().put(DefValConstants.DICT_NULL_VAL_KEY, new DefDict()).build();
                }
            };
            Map<String, CacheResult<DefDict>> map = cachePlusOps.hGetAll(DictCacheKeyBuilder.builder(dictKey), fun);
            map.forEach((itemKey, itemName) -> {
                if (!DefValConstants.DICT_NULL_VAL_KEY.equals(itemKey)) {
                    codeValueMap.put(StrUtil.join(ips.getDictSeparator(), dictKey, itemKey), itemName.getValue());
                }
            });
        });
        return codeValueMap;
    }


    @Override
    public Map<String, List<DefDictItemResultVO>> findDictMapItemListByKey(List<String> dictKeys) {
        if (CollUtil.isEmpty(dictKeys)) {
            return Collections.emptyMap();
        }
        LbQueryWrap<DefDict> query = Wraps.<DefDict>lbQ().in(DefDict::getParentKey, dictKeys).orderByAsc(DefDict::getSortValue);
        List<DefDict> list = super.list(query);
        List<DefDictItemResultVO> voList = BeanUtil.copyToList(list, DefDictItemResultVO.class);

        //key 是类型
        return voList.stream().collect(groupingBy(DefDictItemResultVO::getParentKey, LinkedHashMap::new, toList()));
    }

    @Override
    public boolean removeItemByIds(Collection<Long> idList) {
        if (CollUtil.isEmpty(idList)) {
            return false;
        }
        List<DefDict> list = listByIds(idList);
        if (CollUtil.isEmpty(list)) {
            return false;
        }
        boolean flag = removeByIds(idList);

        CacheHashKey[] hashKeys = list.stream().map(model -> DictCacheKeyBuilder.builder(model.getParentKey(), model.getKey())).toArray(CacheHashKey[]::new);
        cachePlusOps.del(hashKeys);
        return flag;
    }
}
