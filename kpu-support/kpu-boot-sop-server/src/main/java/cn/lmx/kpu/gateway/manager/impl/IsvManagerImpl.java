package cn.lmx.kpu.gateway.manager.impl;


import cn.lmx.basic.cache.repository.CachePlusOps;
import cn.lmx.kpu.common.cache.common.CaptchaCacheKeyBuilder;
import cn.lmx.kpu.gateway.common.CacheKey;
import cn.lmx.kpu.gateway.manager.IsvManager;
import cn.lmx.kpu.gateway.util.CopyUtil;
import cn.lmx.kpu.sop.admin.dto.IsvDTO;
import cn.lmx.kpu.sop.admin.entity.SopIsvInfo;
import cn.lmx.kpu.sop.admin.mapper.SopIsvInfoMapper;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * @author 六如
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class IsvManagerImpl implements IsvManager {

    private static final String KEY_ISV = CacheKey.KEY_ISV;
    protected final SopIsvInfoMapper isvInfoMapper;
    private final CachePlusOps cacheOps;

    @Override
    public IsvDTO getIsv(String appId) {
        return cacheOps.get(CaptchaCacheKeyBuilder.build(appId, KEY_ISV), k -> {
            SopIsvInfo isvInfo = isvInfoMapper.getByAppId(appId);
            return CopyUtil.copyBean(isvInfo, IsvDTO::new);
        }).getValue();
    }

    protected void cache(String appId, IsvDTO isvDTO) {
        cacheOps.set(CaptchaCacheKeyBuilder.build(appId, KEY_ISV), isvDTO);
        log.debug("更新isv redis缓存, isvDTO={}", isvDTO);
    }

    @Override
    public Map<String, IsvDTO> refresh(List<String> appIds) {
        log.info("刷新isv, appId={}", appIds);
        if (CollectionUtils.isEmpty(appIds)) {
            return Collections.emptyMap();
        }
        Map<String, IsvDTO> map = new HashMap<>(appIds.size() * 2);
        for (String appId : appIds) {
            SopIsvInfo isvInfo = isvInfoMapper.getByAppId(appId);
            IsvDTO isvDTO = CopyUtil.copyBean(isvInfo, IsvDTO::new);
            map.put(appId, isvDTO);

            cache(appId, isvDTO);
        }
        return map;
    }

    @PostConstruct
    @Override
    public void init() {
        log.info("load isvInfo to redis");
        List<SopIsvInfo> isvInfos = this.isvInfoMapper.selectList(null);
        for (SopIsvInfo isvInfo : isvInfos) {
            this.cache(isvInfo.getAppId(), CopyUtil.copyBean(isvInfo, IsvDTO::new));
        }
    }
}
