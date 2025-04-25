package cn.lmx.kpu.common.cache.common;


import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyTable;

import java.time.Duration;

/**
 * 参数 KEY
 * <p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class CaptchaCacheKeyBuilder implements CacheKeyBuilder {
    public static CacheKey build(String key, String template) {
        return new CaptchaCacheKeyBuilder().key(key, template);
    }

    @Override
    public String getTable() {
        return CacheKeyTable.CAPTCHA;
    }

    @Override
    public String getTenant() {
        return null;
    }

    @Override
    public Duration getExpire() {
        return Duration.ofMinutes(15);
    }
}
