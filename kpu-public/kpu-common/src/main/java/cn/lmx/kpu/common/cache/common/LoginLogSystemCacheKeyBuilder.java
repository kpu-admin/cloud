package cn.lmx.kpu.common.cache.common;


import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyTable;

/**
 * 参数 KEY
 * {tenant}:LOGIN_LOG_SYSTEM -> long
 * <p>
 * #c_login_log
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class LoginLogSystemCacheKeyBuilder implements CacheKeyBuilder {
    @Override
    public String getTable() {
        return CacheKeyTable.LOGIN_LOG_SYSTEM;
    }

}
