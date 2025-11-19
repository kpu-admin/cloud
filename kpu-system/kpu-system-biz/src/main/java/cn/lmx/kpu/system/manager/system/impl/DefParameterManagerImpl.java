package cn.lmx.kpu.system.manager.system.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.cache.redis2.CacheResult;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.kpu.common.cache.tenant.base.DictParameterKeyBuilder;
import cn.lmx.kpu.system.entity.system.DefParameter;
import cn.lmx.kpu.system.manager.system.DefParameterManager;
import cn.lmx.kpu.system.mapper.system.DefParameterMapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.*;

/**
 * <p>
 * 通用业务实现类
 * 参数配置
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DefParameterManagerImpl extends SuperCacheManagerImpl<DefParameterMapper, DefParameter> implements DefParameterManager {
    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new DictParameterKeyBuilder();
    }

    @Override

    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        if (CollUtil.isEmpty(ids)) {
            return Collections.emptyMap();
        }
        return CollHelper.uniqueIndex(find(ids), DefParameter::getId, DefParameter::getName);
    }

    public List<DefParameter> find(Set<Serializable> ids) {
        // 强转， 防止数据库隐式转换，  若你的id 是string类型，请勿强转
        return super.listByIds(ids.stream().filter(Objects::nonNull).map(Convert::toLong).toList());
    }

    @Override

    public Map<String, String> findParamMapByKey(List<String> paramsKeys) {
        if (CollUtil.isEmpty(paramsKeys)) {
            return Collections.emptyMap();
        }
        LbQueryWrap<DefParameter> query = Wraps.<DefParameter>lbQ().in(DefParameter::getKey, paramsKeys).eq(DefParameter::getState, true);
        List<DefParameter> list = super.list(query);

        //key 是类型
        return CollHelper.uniqueIndex(list, DefParameter::getKey, DefParameter::getValue);
    }

    private DefParameter findByKey(String paramsKey) {
        CacheKey key = DictParameterKeyBuilder.builder(paramsKey);
        CacheResult<Long> result = cacheOps.get(key, k -> {
            DefParameter parameter = getOne(Wrappers.<DefParameter>lambdaQuery().eq(DefParameter::getKey, paramsKey), false);
            return parameter != null ? parameter.getId() : null;
        });
        return getByIdCache(result.getValue());
    }

    @Override
    public String findValueByKey(String paramsKey) {
        DefParameter defParameter = findByKey(paramsKey);
        if (defParameter == null) {
            return null;
        }
        return defParameter.getValue();
    }

    @Override
    public void delCache(Serializable... ids) {
        super.delCache(ids);

    }

    @Override
    public Boolean updateValueByKey(String paramsKey, String value) {
        DefParameter defParameter = findByKey(paramsKey);
        delCache(paramsKey);
        if (defParameter == null) {
            DefParameter parameter = new DefParameter();
            parameter.setKey(paramsKey);
            parameter.setValue(value);
            return save(parameter);
        }

        defParameter.setValue(value);

        return updateById(defParameter);
    }
}
