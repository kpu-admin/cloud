package cn.lmx.kpu.system.manager.application.impl;

import cn.hutool.core.convert.Convert;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.tenant.application.ResourceApiCacheKeyBuilder;
import cn.lmx.kpu.common.cache.tenant.application.ResourceResourceApiCacheKeyBuilder;
import cn.lmx.kpu.model.vo.result.ResourceApiVO;
import cn.lmx.kpu.system.entity.application.DefResourceApi;
import cn.lmx.kpu.system.manager.application.DefResourceApiManager;
import cn.lmx.kpu.system.mapper.application.DefResourceApiMapper;

import java.util.List;

/**
 * 应用管理
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class DefResourceApiManagerImpl extends SuperCacheManagerImpl<DefResourceApiMapper, DefResourceApi> implements DefResourceApiManager {
    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new ResourceApiCacheKeyBuilder();
    }

    @Override
    public List<ResourceApiVO> findAllApi() {
        return baseMapper.findAllApi();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void removeByResourceId(List<Long> resourceIdList) {
        LbQueryWrap<DefResourceApi> wrap = Wraps.<DefResourceApi>lbQ().select(DefResourceApi::getId).in(DefResourceApi::getResourceId, resourceIdList);
        List<Long> apiIds = listObjs(wrap, Convert::toLong);
        remove(wrap);

        CacheKey[] keys = apiIds.stream().map(ResourceApiCacheKeyBuilder::builder).toArray(CacheKey[]::new);
        cacheOps.del(keys);

        CacheKey[] resourceResourceApiKeys = resourceIdList.stream().map(ResourceResourceApiCacheKeyBuilder::builder).toArray(CacheKey[]::new);
        cacheOps.del(resourceResourceApiKeys);
    }

    @Override
    public List<DefResourceApi> findByResourceId(Long resourceId) {
        return list(Wraps.<DefResourceApi>lbQ().eq(DefResourceApi::getResourceId, resourceId));
    }

}
