package cn.lmx.kpu.oauth.service;

import cn.lmx.kpu.base.entity.user.BaseOrg;
import cn.lmx.kpu.oauth.vo.param.RegisterByEmailVO;
import cn.lmx.kpu.oauth.vo.param.RegisterByMobileVO;
import cn.lmx.kpu.oauth.vo.result.OrgResultVO;

import java.util.List;
import java.util.Map;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public interface UserInfoService {
    /**
     * 根据单位ID查找部门
     *
     * @param companyId 单位ID
     * @param employeeId  员工id
     * @return java.util.List<cn.lmx.kpu.base.entity.model.SysOrg>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    List<BaseOrg> findDeptByCompany(Long companyId, Long employeeId);

    /**
     * 查询单位和部门信息
     *
     * @return result.vo.oauth.cn.lmx.kpu.OrgResultVO
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    OrgResultVO findCompanyAndDept();


    /**
     * 注册
     *
     * @param register 注册
     * @return
     */
    String registerByMobile(RegisterByMobileVO register);

    /**
     * 注册
     *
     * @param register 注册
     * @return
     */
    String registerByEmail(RegisterByEmailVO register);

    /**
     * 【演示专用接口】 注册临时管理员账号密码
     *
     * @param type 账号类型
     * @return
     */
    Map<String, Object> registerTempAdmin(String type);
}
