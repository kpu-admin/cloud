package cn.lmx.kpu.sop.admin.service.impl;

import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopSysConfigService;
import cn.lmx.kpu.sop.admin.manager.SopSysConfigManager;
import cn.lmx.kpu.sop.admin.entity.SopSysConfig;

/**
 * <p>
 * 业务实现类
 * 系统配置表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopSysConfigServiceImpl extends SuperServiceImpl<SopSysConfigManager, Long, SopSysConfig> implements SopSysConfigService {



}


