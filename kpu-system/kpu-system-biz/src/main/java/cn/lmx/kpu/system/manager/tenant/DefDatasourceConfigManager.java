package cn.lmx.kpu.system.manager.tenant;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.system.entity.tenant.DefDatasourceConfig;

/**
 * <p>
 * 通用业务层
 * 数据源
 * </p>
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public interface DefDatasourceConfigManager extends SuperManager<DefDatasourceConfig> {

    /**
     * 根据名称查询
     *
     * @param dsName
     * @return
     */
    DefDatasourceConfig getByName(String dsName);
}
