package cn.lmx.kpu.loginuser.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import cn.lmx.basic.base.R;
import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.model.entity.system.SysUser;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@FeignClient(name = "${" + Constants.PROJECT_PREFIX + ".feign.system-server:kpu-system-server}")
public interface SystemApi {
    /**
     * 查询用户信息
     *
     * @param id 用户ID
     * @return cn.lmx.basic.base.R<cn.lmx.kpu.system.entity.model.SysUser>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @GetMapping("/defUser/{id}")
    R<SysUser> getUserById(@PathVariable Long id);
}
