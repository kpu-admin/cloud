package cn.lmx.kpu.common.cache.common;


import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyTable;

/**
 * 参数 KEY
 * {tenant}:TOTAL_PV -> long
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class TotalPvCacheKeyBuilder implements CacheKeyBuilder {
    public static CacheKey build() {
        return new TotalPvCacheKeyBuilder().key();
    }

    @Override
    public String getTable() {
        return CacheKeyTable.TOTAL_PV;
    }
}
