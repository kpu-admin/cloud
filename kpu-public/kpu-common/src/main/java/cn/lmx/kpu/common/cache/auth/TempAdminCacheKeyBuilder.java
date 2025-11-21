package cn.lmx.kpu.common.cache.auth;


import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;

import java.time.Duration;

/**
 * 临时管理员账号
 * @author lmx
 * @since 2025-01-01 00:00
 */
public class TempAdminCacheKeyBuilder implements CacheKeyBuilder {

    public static CacheKey builder(String username) {
        return new TempAdminCacheKeyBuilder().key(username);
    }

    public static CacheKey builder(String username, String type) {
        return new TempAdminCacheKeyBuilder().key(username, type);
    }

    @Override
    public String getTable() {
        return "admin_user";
    }


    @Override
    public Duration getExpire() {
        return Duration.ofMinutes(5);
    }
}
