package cn.lmx.kpu.gateway.manager.impl;


import cn.lmx.basic.cache.repository.CachePlusOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.kpu.common.cache.common.CaptchaCacheKeyBuilder;
import cn.lmx.kpu.gateway.common.ApiInfoDTO;
import cn.lmx.kpu.gateway.manager.ApiManager;
import cn.lmx.kpu.gateway.util.CopyUtil;
import cn.lmx.kpu.sop.admin.entity.SopApiInfo;
import cn.lmx.kpu.sop.admin.mapper.SopApiInfoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author 六如
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class ApiManagerImpl implements ApiManager {
    private static final String KEY_API = "sop:api";

    private final CachePlusOps cachePlusOps;

    @Autowired
    protected SopApiInfoMapper apiInfoMapper;

    @Override
    public void save(ApiInfoDTO apiInfoDTO) {
        String key = apiInfoDTO.buildApiNameVersion();
        CacheKey cacheKey = CaptchaCacheKeyBuilder.build(key, KEY_API);
        cachePlusOps.set(cacheKey, apiInfoDTO);
    }


    @Override
    public ApiInfoDTO get(String apiName, String apiVersion) {
        String key = apiName + apiVersion;

        return cachePlusOps.get(CaptchaCacheKeyBuilder.build(key, KEY_API), (k) -> {
            SopApiInfo apiInfo = apiInfoMapper.getByNameVersion(apiName, apiVersion);
            return apiInfo == null ? null : CopyUtil.copyBean(apiInfo, ApiInfoDTO::new);
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
        ApiInfoDTO apiInfoDTO = CopyUtil.copyBean(apiInfo, ApiInfoDTO::new);
        String key = apiInfoDTO.buildApiNameVersion();
        CacheKey cacheKey = CaptchaCacheKeyBuilder.build(key, KEY_API);
        cachePlusOps.set(cacheKey, apiInfoDTO);
        log.info("更新接口本地缓存, apiInfoDTO={}", apiInfoDTO);
        return apiInfoDTO;
    }

}

