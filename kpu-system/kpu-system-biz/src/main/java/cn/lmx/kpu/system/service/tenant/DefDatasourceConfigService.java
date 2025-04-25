package cn.lmx.kpu.system.service.tenant;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.system.entity.tenant.DefDatasourceConfig;

/**
 * <p>
 * 业务接口
 * 数据源
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DefDatasourceConfigService extends SuperService<Long, DefDatasourceConfig> {
    /**
     * 测试数据源链接
     *
     * @param id 数据源信息
     * @return
     */
    Boolean testConnection(Long id);
}
