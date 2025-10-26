package cn.lmx.kpu.gateway.manager.impl;


import cn.lmx.basic.cache.repository.CachePlusOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.common.cache.common.SOPCacheKeyBuilder;
import cn.lmx.kpu.gateway.common.ApiInfoDTO;
import cn.lmx.kpu.gateway.common.CacheKey;
import cn.lmx.kpu.gateway.manager.ApiManager;
import cn.lmx.kpu.sop.admin.entity.SopApiInfo;
import cn.lmx.kpu.sop.admin.mapper.SopApiInfoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @author 六如
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class ApiManagerImpl implements ApiManager {
    private static final String KEY_API = CacheKey.KEY_API;

    private final CachePlusOps cachePlusOps;

    @Autowired
    protected SopApiInfoMapper apiInfoMapper;

    @Override
    public void save(ApiInfoDTO apiInfoDTO) {
        String key = apiInfoDTO.buildApiNameVersion();
        cachePlusOps.set(SOPCacheKeyBuilder.build(KEY_API, key), apiInfoDTO);
    }


    @Override
    public ApiInfoDTO get(String apiName, String apiVersion) {
        String key = apiName + apiVersion;

        return cachePlusOps.get(SOPCacheKeyBuilder.build(KEY_API, key), (k) -> {
            SopApiInfo apiInfo = apiInfoMapper.getByNameVersion(apiName, apiVersion);
            return apiInfo == null ? null : BeanPlusUtil.toBean(apiInfo, ApiInfoDTO.class);
        }).getValue();

    }

    @Override
    public Map<Long, ApiInfoDTO> refresh(List<Long> id) {
        log.info("刷新api信息, id={}", id);
        List<SopApiInfo> sopApiInfos = apiInfoMapper.selectList(Wraps.<SopApiInfo>lbQ()
                .in(SopApiInfo::getId, id));
        sopApiInfos.forEach(this::cache);
        return Collections.emptyMap();
    }

    protected ApiInfoDTO cache(SopApiInfo apiInfo) {
        ApiInfoDTO apiInfoDTO = BeanPlusUtil.toBean(apiInfo, ApiInfoDTO.class);
        String key = apiInfoDTO.buildApiNameVersion();
        cachePlusOps.set(SOPCacheKeyBuilder.build(KEY_API, key), apiInfoDTO);
        log.info("更新接口本地缓存, apiInfoDTO={}", apiInfoDTO);
        return apiInfoDTO;
    }

}

