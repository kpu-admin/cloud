package cn.lmx.kpu.sop.admin.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopPermIsvGroupService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopPermIsvGroupManager;
import cn.lmx.kpu.sop.admin.entity.SopPermIsvGroup;

/**
 * <p>
 * 业务实现类
 * isv分组
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
public class SopPermIsvGroupServiceImpl extends SuperServiceImpl<SopPermIsvGroupManager, Long, SopPermIsvGroup> implements SopPermIsvGroupService {


}


