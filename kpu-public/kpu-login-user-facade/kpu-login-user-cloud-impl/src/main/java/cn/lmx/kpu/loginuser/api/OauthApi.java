package cn.lmx.kpu.loginuser.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.lmx.basic.base.R;
import cn.lmx.basic.constant.Constants;

import java.util.List;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@FeignClient(name = "${" + Constants.PROJECT_PREFIX + ".feign.oauth-server:kpu-oauth-server}")
public interface OauthApi {

    /**
     * 查询可用的 资源编码
     *
     * @param employeeId    员工ID， 不能为空
     * @param applicationId 应用ID， 可以为空
     * @return cn.lmx.basic.base.R<java.util.List < java.lang.String>>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @GetMapping("/anyone/findVisibleResource")
    R<List<String>> findVisibleResource(@RequestParam(value = "employeeId") Long employeeId,
                                        @RequestParam(value = "applicationId", required = false) Long applicationId);
}
