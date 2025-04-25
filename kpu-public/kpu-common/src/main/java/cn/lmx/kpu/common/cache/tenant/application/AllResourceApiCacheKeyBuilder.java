package cn.lmx.kpu.common.cache.tenant.application;

import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyModular;
import cn.lmx.kpu.common.cache.CacheKeyTable;

import java.time.Duration;

/**
 * 系统的所有资源接口 KEY
 * [服务模块名:]业务类型[:业务字段][:value类型] -> obj
 * system:all_dra:obj-> {}
 * <p>
 * #def_resource
 *
 * @author lmx
 * @since  2025-01-01 00:00
 */
public class AllResourceApiCacheKeyBuilder implements CacheKeyBuilder {
    public static CacheKey builder() {
        return new AllResourceApiCacheKeyBuilder().key();
    }

    @Override
    public String getTenant() {
        return null;
    }

    @Override
    public String getPrefix() {
        return CacheKeyModular.PREFIX;
    }

    @Override
    public String getModular() {
        return CacheKeyModular.SYSTEM;
    }

    @Override
    public String getTable() {
        return CacheKeyTable.System.ALL_RESOURCE_API;
    }

    @Override
    public String getField() {
        return SuperEntity.ID_FIELD;
    }

    @Override
    public ValueType getValueType() {
        return ValueType.obj;
    }

    @Override
    public Duration getExpire() {
        return Duration.ofHours(24);
    }
}
