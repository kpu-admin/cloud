package cn.lmx.kpu.gateway.interceptor.internal;

import cn.lmx.kpu.gateway.common.ApiInfoDTO;
import cn.lmx.kpu.gateway.common.RouteContext;
import cn.lmx.kpu.gateway.common.enums.YesOrNoEnum;
import cn.lmx.kpu.gateway.exception.ApiException;
import cn.lmx.kpu.gateway.interceptor.RouteInterceptor;
import cn.lmx.kpu.gateway.message.ErrorEnum;
import cn.lmx.kpu.gateway.request.ApiRequestContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 校验token
 *
 * @author 六如
 */
@Component
@Slf4j
public class TokenValidateInterceptor implements RouteInterceptor {
    @Override
    public void preRoute(RouteContext routeContext) {
        ApiRequestContext apiRequestContext = routeContext.getApiRequestContext();
        ApiInfoDTO apiInfo = routeContext.getApiInfo();
        // 走到这里token肯定有值
        String appAuthToken = apiRequestContext.getApiRequest().getAppAuthToken();

        if (!checkToken(appAuthToken, apiRequestContext, apiInfo)) {
            throw new ApiException(ErrorEnum.AOP_INVALID_AUTH_TOKEN, apiRequestContext.getLocale());
        }
    }

    @Override
    public boolean match(RouteContext routeContext) {
        ApiInfoDTO apiInfo = routeContext.getApiInfo();
        Integer isNeedToken = apiInfo.getIsNeedToken();
        return YesOrNoEnum.of(isNeedToken) == YesOrNoEnum.YES;
    }

    /**
     * 校验token是否合法
     *
     * @param appAuthToken token
     * @param context      上下文
     * @param apiInfoDTO   接口信息
     * @return 返回true表示token合法，false不合法
     */
    protected boolean checkToken(String appAuthToken, ApiRequestContext context, ApiInfoDTO apiInfoDTO) {
        // 这里做校验token操作，如从redis查询token是否存在

        return true;
    }
}
