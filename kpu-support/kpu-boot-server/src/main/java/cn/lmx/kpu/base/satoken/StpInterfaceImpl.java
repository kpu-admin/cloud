package cn.lmx.kpu.base.satoken;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.basic.utils.StrPool;
import cn.lmx.kpu.base.service.system.BaseRoleService;
import cn.lmx.kpu.common.constant.RoleConstant;
import cn.lmx.kpu.system.entity.application.DefResource;
import cn.lmx.kpu.system.service.application.DefResourceService;

import java.util.Collections;
import java.util.List;

import static cn.lmx.basic.context.ContextConstants.JWT_KEY_EMPLOYEE_ID;

/**
 * sa-token 权限实现
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Component
@RequiredArgsConstructor
@Slf4j
public class StpInterfaceImpl implements StpInterface {
    private final DefResourceService defResourceService;
    private final BaseRoleService baseRoleService;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        SaSession tokenSession = StpUtil.getTokenSession();
        long employeeId = tokenSession.getLong(JWT_KEY_EMPLOYEE_ID);
        // 超管 返回 *
        List<DefResource> list;
        boolean isAdmin = baseRoleService.checkRole(employeeId, RoleConstant.TENANT_ADMIN);
        List<String> resourceCodes = Collections.emptyList();
        if (isAdmin) {
            // 管理员 拥有所有权限
            list = List.of(DefResource.builder().code("*").build());
        } else {
            List<Long> resourceIdList = baseRoleService.findResourceIdByEmployeeId(null, employeeId);
            if (resourceIdList.isEmpty()) {
                return Collections.emptyList();
            }

            list = defResourceService.findByIdsAndType(resourceIdList, resourceCodes);
        }
        return CollHelper.split(list, DefResource::getCode, StrPool.SEMICOLON);
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        SaSession tokenSession = StpUtil.getTokenSession();
        long employeeId = tokenSession.getLong(JWT_KEY_EMPLOYEE_ID);
        boolean isAdmin = baseRoleService.checkRole(employeeId, RoleConstant.TENANT_ADMIN);
        if (isAdmin) {
            return List.of("*");
        } else {
            return baseRoleService.findRoleCodeByEmployeeId(employeeId);
        }
    }
}
