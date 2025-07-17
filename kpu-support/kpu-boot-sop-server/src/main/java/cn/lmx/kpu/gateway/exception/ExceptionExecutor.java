package cn.lmx.kpu.gateway.exception;


import cn.lmx.kpu.gateway.request.ApiRequestContext;
import cn.lmx.kpu.gateway.response.ApiResponse;

/**
 * @author 六如
 */
public interface ExceptionExecutor {

    ApiResponse executeException(ApiRequestContext apiRequestContext, Exception e);

}
