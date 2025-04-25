package cn.lmx.kpu.common.cache.common;


import cn.hutool.core.util.StrUtil;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyTable;

/**
 * online:{userid} -> token (String)
 * <p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class OnlineCacheKeyBuilder implements CacheKeyBuilder {
    @Override
    public String getTable() {
        return CacheKeyTable.ONLINE;
    }

    /**
     * 获取通配符
     *
     * @return key 前缀
     */
    @Override
    public String getPattern() {
        return StrUtil.format("{}:{}:*", getTenant(), getTable());
    }
}
