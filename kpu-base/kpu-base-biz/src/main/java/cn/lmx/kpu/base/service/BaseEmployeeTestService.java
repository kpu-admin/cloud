package cn.lmx.kpu.base.service;

import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.kpu.base.entity.user.BaseEmployee;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public interface BaseEmployeeTestService extends SuperCacheManager<BaseEmployee> {
    /**
     * 单体查询
     *
     * @param id id
     * @return cn.lmx.kpu.user.entity.base.kpu.BaseEmployee
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    BaseEmployee get(Long id);
}
