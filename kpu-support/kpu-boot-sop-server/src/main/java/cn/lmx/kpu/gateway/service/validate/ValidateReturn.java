package cn.lmx.kpu.gateway.service.validate;

import cn.lmx.kpu.gateway.common.ApiInfoDTO;
import cn.lmx.kpu.sop.admin.dto.IsvDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author 六如
 */
@AllArgsConstructor
@Getter
public class ValidateReturn {
    private ApiInfoDTO apiInfoDTO;
    private IsvDTO isvDTO;
}
