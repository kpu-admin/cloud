package cn.lmx.kpu.gateway.common;

import cn.lmx.kpu.gateway.request.ApiRequestContext;
import cn.lmx.kpu.sop.admin.dto.IsvDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author 六如
 */
@Getter
@AllArgsConstructor
public class RouteContext {

    private ApiRequestContext apiRequestContext;
    private ApiInfoDTO apiInfo;
    private IsvDTO isv;

}
