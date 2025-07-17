package cn.lmx.kpu.sop.admin.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.admin.entity.SopPermGroupPermission;
import cn.lmx.kpu.sop.admin.vo.save.SopPermGroupPermissionSaveVO;


/**
 * <p>
 * 业务接口
 * 组权限表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
public interface SopPermGroupPermissionService extends SuperService<Long, SopPermGroupPermission> {
   void delete(SopPermGroupPermissionSaveVO params);
}


