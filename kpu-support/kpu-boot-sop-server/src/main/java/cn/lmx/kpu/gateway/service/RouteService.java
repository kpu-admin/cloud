package cn.lmx.kpu.gateway.service;

import cn.lmx.kpu.gateway.request.ApiRequestContext;
import cn.lmx.kpu.gateway.response.Response;

/**
 * 接口路由
 *
 * @author 六如
 */
public interface RouteService {

    /**
     * 路由
     *
     * @param apiRequestContext 接口上下文
     * @return 返回结果
     */
    Response route(ApiRequestContext apiRequestContext);

}
