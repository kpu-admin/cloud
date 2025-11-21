package cn.lmx.kpu.common.cache.shop.user;

import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyModular;
import cn.lmx.kpu.common.cache.CacheKeyTable;

import java.time.Duration;

/**
 * 系统用户 KEY
 * <p>
 * #def_user
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class MemberUserMobileCacheKeyBuilder implements CacheKeyBuilder {

    public static CacheKey builder(String mobile) {
        return new MemberUserMobileCacheKeyBuilder().key(mobile);
    }



    @Override
    public String getTable() {
        return CacheKeyTable.Shop.MEMBER_USER;
    }

    @Override
    public String getModular() {
        return CacheKeyModular.SHOP;
    }

    @Override
    public String getField() {
        return "mobile";
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
