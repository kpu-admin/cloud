package cn.lmx.kpu.base.interceptor;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.error.SaErrorCode;
import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.router.SaHttpMethod;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.spring.pathmatch.SaPathPatternParserUtil;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.web.method.HandlerMethod;
import cn.lmx.basic.context.ContextConstants;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.kpu.common.properties.IgnoreProperties;
import cn.lmx.kpu.system.facade.DefResourceFacade;

import java.util.List;
import java.util.Map;
import java.util.Set;

import static cn.lmx.basic.context.ContextConstants.JWT_KEY_COMPANY_ID;
import static cn.lmx.basic.context.ContextConstants.JWT_KEY_DEPT_ID;
import static cn.lmx.basic.context.ContextConstants.JWT_KEY_EMPLOYEE_ID;
import static cn.lmx.basic.context.ContextConstants.JWT_KEY_TOP_COMPANY_ID;

/**
 * 配合sa-token，实现 登录校验、uri校验
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Slf4j
public class AuthenticationSaInterceptor extends SaInterceptor {
    private final DefResourceFacade defResourceFacade;
    private final IgnoreProperties ignoreProperties;

    public AuthenticationSaInterceptor(IgnoreProperties ignoreProperties, DefResourceFacade defResourceFacade) {
        this.defResourceFacade = defResourceFacade;
        this.ignoreProperties = ignoreProperties;
        this.auth = handler -> {
            Map<String, Set<String>> anyUser = ignoreProperties.buildAnyUser();
            // 验证token 排除掉需要租户ID，但不需要登录
            SaRouter
                    .match("/**")    // 拦截的 path 列表，可以写多个 */
                    .notMatch(r -> {
                        String path = SaHolder.getRequest().getRequestPath();
                        String method = SaHolder.getRequest().getMethod();
                        for (Map.Entry<String, Set<String>> map : anyUser.entrySet()) {
                            String key = map.getKey();
                            Set<String> value = map.getValue();
                            if (StrUtil.equalsAny(key, method, SaHttpMethod.ALL.name())) {
                                for (String ignore : value) {
                                    if (StrUtil.equals(ignore, path)) {
                                        return true;
                                    }

                                    if (SaPathPatternParserUtil.match(ignore, path)) {
                                        return true;
                                    }
                                }
                            }
                        }
                        return false;
                    })
                    .check(r -> StpUtil.checkLogin());

            // 接口权限
            Map<String, Set<String>> anyone = ignoreProperties.buildAnyone();
            Map<String, Set<String>> allApi = this.defResourceFacade.listAllApi();

            allApi.forEach((api, auth) -> {
                List<String> list = StrUtil.split(api, "###");
                String uri = list.get(0);
                String requestMethod = list.get(1);
                SaRouter.match(uri).matchMethod(requestMethod)
                        .notMatch(r -> {
                            String path = SaHolder.getRequest().getRequestPath();
                            String method = SaHolder.getRequest().getMethod();
                            for (Map.Entry<String, Set<String>> map : anyone.entrySet()) {
                                String key = map.getKey();
                                Set<String> value = map.getValue();
                                if (StrUtil.equalsAny(key, method, SaHttpMethod.ALL.name())) {
                                    for (String ignore : value) {
                                        if (StrUtil.equals(ignore, path)) {
                                            return true;
                                        }

                                        if (SaPathPatternParserUtil.match(ignore, path)) {
                                            return true;
                                        }
                                    }
                                }
                            }
                            return false;
                        })
                        .check(r -> StpUtil.checkPermissionOr(auth.toArray(String[]::new)));
            });


            if (!ignoreProperties.getNotConfigUriAllow()) {
                String path = SaHolder.getRequest().getRequestPath();
                String method = SaHolder.getRequest().getMethod();

                if (!ignoreProperties.isIgnoreAnyone(method, path)) {
                    boolean flag = false;
                    for (Map.Entry<String, Set<String>> map : allApi.entrySet()) {
                        List<String> list = StrUtil.split(map.getKey(), "###");
                        String uri = list.get(0);
                        String requestMethod = list.get(1);

                        if (StrUtil.equalsAny(requestMethod, method, SaHttpMethod.ALL.name())) {
                            if (StrUtil.equals(uri, path) || SaPathPatternParserUtil.match(uri, path)) {
                                flag = true;
                            }
                        }
                    }

                    if (!flag) {
                        throw new NotPermissionException(path, StpUtil.TYPE).setCode(SaErrorCode.CODE_11051);
                    }
                }
            }

        };
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            log.debug("not exec!!! url={}", request.getRequestURL());
            return true;
        }

        boolean flag = super.preHandle(request, response, handler);
        parseToken(request);
        return flag;
    }


    private void parseToken(HttpServletRequest request) {
        // 忽略 token 认证的接口
        if (ignoreProperties.isIgnoreUser(request.getMethod(), request.getRequestURI())) {
            log.debug("access filter not execute");
            return;
        }
        SaSession tokenSession = StpUtil.getTokenSession();
        Long userId = (Long) tokenSession.getLoginId();
        Long topCompanyId = (Long) tokenSession.get(JWT_KEY_TOP_COMPANY_ID);
        Long companyId = (Long) tokenSession.get(JWT_KEY_COMPANY_ID);
        Long deptId = (Long) tokenSession.get(JWT_KEY_DEPT_ID);
        Long employeeId = (Long) tokenSession.get(JWT_KEY_EMPLOYEE_ID);

        //6, 转换，将 token 解析出来的用户身份 和 解码后的tenant、Authorization 重新封装到请求头
        ContextUtil.setUserId(userId);
        ContextUtil.setEmployeeId(employeeId);
        ContextUtil.setCurrentCompanyId(companyId);
        ContextUtil.setCurrentTopCompanyId(topCompanyId);
        ContextUtil.setCurrentDeptId(deptId);
        MDC.put(ContextConstants.USER_ID_HEADER, String.valueOf(userId));
        MDC.put(ContextConstants.EMPLOYEE_ID_HEADER, String.valueOf(employeeId));
    }
}
