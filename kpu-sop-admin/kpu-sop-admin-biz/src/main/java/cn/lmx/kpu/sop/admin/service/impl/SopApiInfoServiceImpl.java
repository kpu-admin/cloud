package cn.lmx.kpu.sop.admin.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopApiInfoService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopApiInfoManager;
import cn.lmx.kpu.sop.admin.entity.SopApiInfo;

/**
 * <p>
 * 业务实现类
 * 接口信息表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopApiInfoServiceImpl extends SuperServiceImpl<SopApiInfoManager, Long, SopApiInfo> implements SopApiInfoService {


}


