package cn.lmx.kpu.common.cache.common;


import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyTable;

/**
 * 参数 KEY
 * {tenant}:PARAMETER_KEY:{key} -> value
 * <p>
 * #c_parameter
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class ParameterKeyCacheKeyBuilder implements CacheKeyBuilder {
    @Override
    public String getTable() {
        return CacheKeyTable.PARAMETER_KEY;
    }

}
