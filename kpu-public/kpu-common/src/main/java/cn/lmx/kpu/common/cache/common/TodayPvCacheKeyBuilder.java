package cn.lmx.kpu.common.cache.common;


import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyTable;

import java.time.Duration;
import java.time.LocalDate;

/**
 * 参数 KEY
 * {tenant}:TODAY_PV:{now} -> long
 * <p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class TodayPvCacheKeyBuilder implements CacheKeyBuilder {
    public static CacheKey build(LocalDate now) {
        return new TodayPvCacheKeyBuilder().key(now.toString());
    }

    @Override
    public String getTable() {
        return CacheKeyTable.TODAY_PV;
    }

    @Override
    public Duration getExpire() {
        return Duration.ofDays(2L);
    }
}
