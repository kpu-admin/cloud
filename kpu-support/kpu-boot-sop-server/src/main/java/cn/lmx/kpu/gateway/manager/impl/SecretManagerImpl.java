package cn.lmx.kpu.gateway.manager.impl;

import cn.lmx.basic.cache.repository.CachePlusOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.common.cache.common.CaptchaCacheKeyBuilder;
import cn.lmx.kpu.gateway.common.CacheKey;
import cn.lmx.kpu.gateway.manager.SecretManager;
import cn.lmx.kpu.sop.admin.entity.SopIsvKeys;
import cn.lmx.kpu.sop.admin.mapper.SopIsvKeysMapper;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * 秘钥管理
 *
 * @author 六如
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SecretManagerImpl implements SecretManager {
    private static final String KEY_SEC = CacheKey.KEY_SEC;
    private final CachePlusOps cacheOps;
    private final SopIsvKeysMapper isvKeysMapper;


    @Override
    public String getIsvPublicKey(Long isvId) {
        return cacheOps.get(CaptchaCacheKeyBuilder.build(isvId + "", KEY_SEC), k -> {
            String publicKey = doGetPublicKey(isvId);
            return publicKey;
        }).getValue();
    }

    protected String doGetPublicKey(Long isvId) {
        SopIsvKeys sopIsvKeys = isvKeysMapper.selectOne(Wraps.<SopIsvKeys>lbQ().eq(SopIsvKeys::getIsvId, isvId));
        return sopIsvKeys != null ? sopIsvKeys.getPublicKeyIsv() : null;
    }

    protected void cache(Long isvId, String publicKey) {
        cacheOps.set(CaptchaCacheKeyBuilder.build(isvId + "", KEY_SEC), publicKey);
        log.info("更新isv秘钥本地缓存, isvId={}", isvId);
    }

    @Override
    public Map<Long, String> refresh(List<Long> isvIds) {
        log.info("刷新isv, appId={}", isvIds);
        if (CollectionUtils.isEmpty(isvIds)) {
            return Collections.emptyMap();
        }
        Map<Long, String> map = new HashMap<>(isvIds.size() * 2);
        for (Long isvId : isvIds) {
            String publicKey = doGetPublicKey(isvId);
            map.put(isvId, publicKey);

            this.cache(isvId, publicKey);
        }
        return map;
    }


    private String buildHashKey(Long isvId) {
        return String.valueOf(isvId);
    }

    @PostConstruct
    @Override
    public void init() {
        log.info("load isvKey to redis");
        List<SopIsvKeys> isvKeys = this.isvKeysMapper.selectList(null);
        for (SopIsvKeys isvKey : isvKeys) {
            this.cache(isvKey.getIsvId(), isvKey.getPublicKeyIsv());
        }
    }
}
