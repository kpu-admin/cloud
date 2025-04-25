package cn.lmx.kpu.loginuser.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import cn.lmx.basic.base.R;
import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.model.entity.base.SysEmployee;
import cn.lmx.kpu.model.entity.base.SysOrg;
import cn.lmx.kpu.model.entity.base.SysPosition;

import java.util.List;

/**
 * 基础服务
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@FeignClient(name = "${" + Constants.PROJECT_PREFIX + ".feign.base-server:kpu-base-server}")
public interface BaseApi {
    /**
     * 查询员工
     *
     * @param id 员工ID
     * @return cn.lmx.basic.base.R<cn.lmx.kpu.base.entity.model.SysEmployee>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @GetMapping("/baseEmployee/{id}")
    R<SysEmployee> getEmployeeById(@PathVariable Long id);

    /**
     * 查询机构信息
     *
     * @param id 机构
     * @return cn.lmx.basic.base.R<cn.lmx.kpu.base.entity.model.SysOrg>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @GetMapping("/baseOrg/{id}")
    R<SysOrg> getOrgById(@PathVariable Long id);

    /**
     * 查询岗位信息
     *
     * @param id 岗位ID
     * @return cn.lmx.basic.base.R<cn.lmx.kpu.base.entity.model.SysPosition>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @GetMapping("/basePosition/{id}")
    R<SysPosition> getPositionById(@PathVariable Long id);

    /**
     * 查询员工的角色编码
     *
     * @param employeeId 员工ID
     * @return cn.lmx.basic.base.R<java.util.List < java.lang.String>>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @GetMapping("/baseRole/findRoleCodeByEmployeeId")
    R<List<String>> findRoleCodeByEmployeeId(@RequestParam("employeeId") Long employeeId);

    /**
     * 查询员工在指定公司下的部门
     *
     * @param employeeId 员工ID
     * @param companyId  公司ID
     * @return cn.lmx.basic.base.R<java.util.List < cn.lmx.kpu.base.entity.model.SysOrg>>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @GetMapping("/baseOrg/findDeptByEmployeeId")
    R<List<SysOrg>> findDeptByEmployeeId(@RequestParam("employeeId") Long employeeId, @RequestParam("companyId") Long companyId);

    /**
     * 查询员工的 公司
     *
     * @param employeeId 员工
     * @return cn.lmx.basic.base.R<java.util.List < cn.lmx.kpu.base.entity.model.SysOrg>>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @GetMapping("/baseOrg/findCompanyByEmployeeId")
    R<List<SysOrg>> findCompanyByEmployeeId(@RequestParam("employeeId") Long employeeId);
}
