package cn.lmx.kpu.sop.admin.service.impl;

import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.admin.vo.save.SopPermGroupPermissionSaveVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopPermGroupPermissionService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopPermGroupPermissionManager;
import cn.lmx.kpu.sop.admin.entity.SopPermGroupPermission;

/**
 * <p>
 * 业务实现类
 * 组权限表
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
public class SopPermGroupPermissionServiceImpl extends SuperServiceImpl<SopPermGroupPermissionManager, Long, SopPermGroupPermission> implements SopPermGroupPermissionService {
    @Override
    public <SaveVO> SopPermGroupPermission save(SaveVO saveVO) {
        SopPermGroupPermissionSaveVO save = (SopPermGroupPermissionSaveVO) saveVO;
        getSuperManager().remove(Wraps.<SopPermGroupPermission>lbQ()
                .eq(SopPermGroupPermission::getGroupId, save.getGroupId()));
        for (Long apiId : save.getApiIdList()) {
            SopPermGroupPermission sopPermGroupPermission = new SopPermGroupPermission();
            sopPermGroupPermission.setGroupId(save.getGroupId());
            sopPermGroupPermission.setApiId(apiId);
           getSuperManager().save(sopPermGroupPermission);
        }
        return null;
    }

    @Override
    @Transactional
    public void delete(SopPermGroupPermissionSaveVO params) {
        getSuperManager().remove(Wraps.<SopPermGroupPermission>lbQ()
                .eq(SopPermGroupPermission::getGroupId, params.getGroupId())
                .in(SopPermGroupPermission::getApiId, params.getApiIdList())
        );
    }
}


