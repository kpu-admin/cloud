package cn.lmx.kpu.sop.admin.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.admin.entity.SopPermGroup;
import cn.lmx.kpu.sop.admin.vo.save.SopPermIsvGroupSaveVO;

import java.util.List;


/**
 * <p>
 * 业务接口
 * 分组表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
public interface SopPermGroupService extends SuperService<Long, SopPermGroup> {

    void updateIsvGroup(SopPermIsvGroupSaveVO param);

    List<Long> listByGroupId(String isvId);
}


