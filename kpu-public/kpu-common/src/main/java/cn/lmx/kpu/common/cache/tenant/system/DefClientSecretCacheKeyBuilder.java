package cn.lmx.kpu.common.cache.tenant.system;

import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyModular;
import cn.lmx.kpu.common.cache.CacheKeyTable;

import java.time.Duration;

/**
 * 客户端
 * <p>
 * #def_client
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class DefClientSecretCacheKeyBuilder implements CacheKeyBuilder {

    public static CacheKey builder(String clientId, String clientSecret) {
        return new DefClientSecretCacheKeyBuilder().key(clientId, clientSecret);
    }

    @Override
    public String getPrefix() {
        return CacheKeyModular.PREFIX;
    }

    @Override
    public String getTenant() {
        return null;
    }

    @Override
    public String getTable() {
        return CacheKeyTable.System.DEF_CLIENT;
    }

    @Override
    public String getModular() {
        return CacheKeyModular.SYSTEM;
    }

    @Override
    public String getField() {
        return "cid.secret";
    }

    @Override
    public ValueType getValueType() {
        return ValueType.string;
    }

    @Override
    public Duration getExpire() {
        return Duration.ofHours(24);
    }

}
