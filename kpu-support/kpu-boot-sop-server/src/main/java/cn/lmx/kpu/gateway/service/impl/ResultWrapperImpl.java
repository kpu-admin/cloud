package cn.lmx.kpu.gateway.service.impl;

import cn.lmx.kpu.gateway.common.ApiInfoDTO;
import cn.lmx.kpu.gateway.common.RouteContext;
import cn.lmx.kpu.gateway.common.enums.YesOrNoEnum;
import cn.lmx.kpu.gateway.config.ApiConfig;
import cn.lmx.kpu.gateway.response.ApiResponse;
import cn.lmx.kpu.gateway.response.NoCommonResponse;
import cn.lmx.kpu.gateway.response.Response;
import cn.lmx.kpu.gateway.service.ResultWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * @author 六如
 */
@Service
public class ResultWrapperImpl implements ResultWrapper {

    @Autowired
    private ApiConfig apiConfig;

    @Override
    public Response wrap(Optional<RouteContext> routeContextOpt, Object result) {
        boolean needNotWrap = routeContextOpt.map(RouteContext::getApiInfo)
                .map(ApiInfoDTO::getHasCommonResponse)
                .map(YesOrNoEnum::of)
                .orElse(YesOrNoEnum.YES) == YesOrNoEnum.NO;
        if (result instanceof ApiResponse) {
            ApiResponse apiResponse = (ApiResponse) result;
            return executeApiResponse(apiResponse, needNotWrap);
        }
        // 不需要公共返回参数
        if (needNotWrap) {
            return NoCommonResponse.success(result);
        }
        return ApiResponse.success(result);
    }

    private Response executeApiResponse(ApiResponse apiResponse, boolean needNotWrap) {
        // 不需要公共返回参数
        if (needNotWrap) {
            return NoCommonResponse.success(apiResponse.getData());
        }
        return apiResponse;
    }

}
