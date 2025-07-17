package cn.lmx.kpu.gateway.service.impl;

import cn.lmx.kpu.gateway.request.ApiRequestContext;
import cn.lmx.kpu.gateway.service.validate.ValidateReturn;
import com.alibaba.fastjson2.JSONObject;
import org.springframework.stereotype.Service;

/**
 * @author 六如
 */
@Service("restRouteService")
public class RestRouteServiceImpl extends RouteServiceImpl {

    @Override
    protected ValidateReturn validate(ApiRequestContext apiRequestContext) {
        return validator.validateRest(apiRequestContext);
    }

    @Override
    protected JSONObject getParamObject(ApiRequestContext apiRequestContext) {
        return apiRequestContext.getRawParams();
    }
}
