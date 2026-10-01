package cn.lmx.kpu.sop.admin.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.sop.admin.entity.SopSysConfig;

/**
 * <p>
 * 通用业务接口
 * 系统配置表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface SopSysConfigManager extends SuperManager<SopSysConfig> {
   String getValueByKey(String key);
}


