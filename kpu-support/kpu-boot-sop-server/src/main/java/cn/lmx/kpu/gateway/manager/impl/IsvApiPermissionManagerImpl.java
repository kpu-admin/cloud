package cn.lmx.kpu.gateway.manager.impl;

import cn.lmx.basic.cache.repository.CacheOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.common.cache.common.SOPCacheKeyBuilder;
import cn.lmx.kpu.gateway.common.ApiInfoDTO;
import cn.lmx.kpu.gateway.common.CacheKey;
import cn.lmx.kpu.gateway.common.enums.YesOrNoEnum;
import cn.lmx.kpu.gateway.manager.IsvApiPermissionManager;
import cn.lmx.kpu.sop.admin.entity.SopApiInfo;
import cn.lmx.kpu.sop.admin.entity.SopPermGroupPermission;
import cn.lmx.kpu.sop.admin.entity.SopPermIsvGroup;
import cn.lmx.kpu.sop.admin.mapper.SopApiInfoMapper;
import cn.lmx.kpu.sop.admin.mapper.SopPermGroupPermissionMapper;
import cn.lmx.kpu.sop.admin.mapper.SopPermIsvGroupMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 缓存ISV接口权限
 *
 * @author 六如
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class IsvApiPermissionManagerImpl implements IsvApiPermissionManager {

    private static final String CACHE_KEY = CacheKey.KEY_ISV_PERM;

    private final CacheOps cacheOps;
    @Autowired
    private SopPermGroupPermissionMapper permGroupPermissionMapper;
    @Autowired
    private SopPermIsvGroupMapper permIsvGroupMapper;
    @Autowired
    private SopApiInfoMapper apiInfoMapper;

    @Override
    public boolean hasPermission(Long isvId, ApiInfoDTO apiInfoDTO) {
        // 通用接口都可以访问
        if (Objects.equals(apiInfoDTO.getIsPermission(), YesOrNoEnum.NO.getValue())) {
            return true;
        }
        return doCheck(isvId, apiInfoDTO);
    }

    public boolean doCheck(Long isvId, ApiInfoDTO apiInfoDTO) {
        List<Long> apiNameVerionList = cacheOps.get(SOPCacheKeyBuilder.build(CACHE_KEY, isvId + ""), k -> this.listApiId(isvId)).getValue();
        if (CollectionUtils.isEmpty(apiNameVerionList)) {
            return false;
        }
        return apiNameVerionList.contains(apiInfoDTO.getId());
    }

    @Override
    public Map<Long, List<Long>> refresh(List<Long> isvIds) {
        log.info("刷新isv接口权限, isvIds={}", isvIds);
        if (CollectionUtils.isEmpty(isvIds)) {
            return Collections.emptyMap();
        }
        Map<Long, List<Long>> map = new HashMap<>(isvIds.size() * 2);
        for (Long isvId : isvIds) {
            List<Long> apiIdList = this.listApiId(isvId);
            map.put(isvId, apiIdList);
            // 缓存
            cache(isvId, apiIdList);
        }
        return map;
    }

    protected void cache(Long isvId, List<Long> apiIdList) {
        cacheOps.set(SOPCacheKeyBuilder.build(CACHE_KEY, isvId + ""), apiIdList);
        log.info("更新isv接口id本地缓存, isvId={}, apiIdList={}", isvId, apiIdList);
    }

    protected List<Long> listApiId(Long isvId) {
        List<Long> groupIds = permIsvGroupMapper.selectList(Wraps.<SopPermIsvGroup>lbQ().eq(SopPermIsvGroup::getIsvId, isvId))
                .stream().filter(Objects::nonNull).map(SopPermIsvGroup::getGroupId)
                .distinct().collect(Collectors.toList());
        if (groupIds.isEmpty()) {
            return Collections.emptyList();
        }
        List<Long> apiIdList = permGroupPermissionMapper.selectList(Wraps.<SopPermGroupPermission>lbQ()
                        .in(SopPermGroupPermission::getGroupId, groupIds))
                .stream().filter(Objects::nonNull).map(SopPermGroupPermission::getApiId)
                .distinct().collect(Collectors.toList());
        if (apiIdList.isEmpty()) {
            return Collections.emptyList();
        }
        return apiInfoMapper.selectList(Wraps.<SopApiInfo>lbQ().select(SopApiInfo::getId)
                        .in(SopApiInfo::getId, apiIdList)).stream()
                .filter(Objects::nonNull).map(SopApiInfo::getId)
                .distinct().collect(Collectors.toList());
    }


}
