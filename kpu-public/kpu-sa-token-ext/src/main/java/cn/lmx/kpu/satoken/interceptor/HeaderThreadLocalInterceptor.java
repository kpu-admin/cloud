package cn.lmx.kpu.satoken.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.AsyncHandlerInterceptor;
import cn.lmx.basic.boot.utils.WebUtils;
import cn.lmx.basic.context.ContextConstants;
import cn.lmx.basic.context.ContextUtil;

import java.util.Map;

/**
 * 拦截器：
 * 将请求头中的数据，封装到 ContextUtil
 *
 * <p>
 * 该拦截器在必须优先于系统中其他的业务拦截器。
 * <p>
 * 微服务模式，必须每个服务都启用该拦截器，通过 kpu.webmvc.header = true 启用
 * 单体模式 必须禁用该拦截器，通过 kpu.webmvc.header = false 禁用
 * <p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@RequiredArgsConstructor
public class HeaderThreadLocalInterceptor implements AsyncHandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        log.info("HeaderThreadLocalInterceptor url={}, method={}", request.getRequestURI(), request.getMethod());
        ContextUtil.setPath(WebUtils.getHeader(request, ContextConstants.PATH_HEADER));

        ContextUtil.setApplicationId(WebUtils.getHeader(request, ContextConstants.APPLICATION_ID_HEADER));
        ContextUtil.setClientId(WebUtils.getHeader(request, ContextConstants.CLIENT_ID_HEADER));
        ContextUtil.setLogTraceId(WebUtils.getHeader(request, ContextConstants.TRACE_ID_HEADER));
        Map<String, String> localMap = ContextUtil.getLocalMap();
        localMap.forEach(MDC::put);

        ContextUtil.setGrayVersion(WebUtils.getHeader(request, ContextConstants.GRAY_VERSION));

        String userId = WebUtils.getHeader(request, ContextConstants.JWT_KEY_USER_ID);
        String employeeId = WebUtils.getHeader(request, ContextConstants.EMPLOYEE_ID_HEADER);
        MDC.put(ContextConstants.USER_ID_HEADER, userId);
        MDC.put(ContextConstants.EMPLOYEE_ID_HEADER, employeeId);
        ContextUtil.setUserId(userId);
        ContextUtil.setEmployeeId(employeeId);
        ContextUtil.setCurrentTopCompanyId(WebUtils.getHeader(request, ContextConstants.CURRENT_TOP_COMPANY_ID_HEADER));
        ContextUtil.setCurrentCompanyId(WebUtils.getHeader(request, ContextConstants.CURRENT_COMPANY_ID_HEADER));
        ContextUtil.setCurrentDeptId(WebUtils.getHeader(request, ContextConstants.CURRENT_DEPT_ID_HEADER));
        return true;
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ContextUtil.remove();
    }
}
