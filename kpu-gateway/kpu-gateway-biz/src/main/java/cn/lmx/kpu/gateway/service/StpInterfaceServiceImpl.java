package cn.lmx.kpu.gateway.service;

import cn.dev33.satoken.stp.StpInterface;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import cn.lmx.kpu.oauth.biz.StpInterfaceBiz;

import java.util.List;

/**
 * sa-token 权限网关实现
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class StpInterfaceServiceImpl implements StpInterface {
    private final StpInterfaceBiz stpInterfaceBiz;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        return stpInterfaceBiz.getPermissionList();
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        return stpInterfaceBiz.getRoleList();
    }
}
