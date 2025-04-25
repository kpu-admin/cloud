package cn.lmx.kpu.system.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import cn.lmx.basic.base.R;
import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.model.entity.system.SysUser;
import cn.lmx.kpu.model.vo.result.UserQuery;
import cn.lmx.kpu.system.api.hystrix.DefUserApiFallback;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 用户
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@FeignClient(name = "${" + Constants.PROJECT_PREFIX + ".feign.tenant-server:kpu-system-server}", fallback = DefUserApiFallback.class)
public interface DefUserApi {
    /**
     * 查询所有的用户id
     *
     * @return 用户id
     */

    @PostMapping(value = "/defUser/findAllUserId")
    R<List<Long>> findAllUserId();


    /**
     * 根据id查询实体
     *
     * @param ids 唯一键（可能不是主键ID)
     * @return
     */
    @PostMapping("/echo/user/findByIds")
    Map<Serializable, Object> findByIds(@RequestParam(value = "ids") Set<Serializable> ids);


    /**
     * 根据id 查询用户详情
     *
     * @param userQuery 查询条件
     * @return 系统用户
     */
    @PostMapping(value = "/anyone/getSysUserById")
    R<SysUser> getById(@RequestBody UserQuery userQuery);
}
