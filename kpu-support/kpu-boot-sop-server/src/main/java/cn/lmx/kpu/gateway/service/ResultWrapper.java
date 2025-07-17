package cn.lmx.kpu.gateway.service;

import cn.lmx.kpu.gateway.common.RouteContext;
import cn.lmx.kpu.gateway.response.Response;

import java.util.Optional;

/**
 * 结果包裹
 *
 * @author 六如
 */
public interface ResultWrapper {

    Response wrap(Optional<RouteContext> routeContextOpt, Object result);

}
