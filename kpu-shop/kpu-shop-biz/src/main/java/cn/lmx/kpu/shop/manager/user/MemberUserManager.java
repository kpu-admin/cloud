package cn.lmx.kpu.shop.manager.user;

import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.basic.interfaces.echo.LoadService;
import cn.lmx.kpu.shop.entity.user.MemberUser;

/**
 * <p>
 * 通用业务接口
 * 商城用户
 * </p>
 *
 * @author lmx
 * @date 2025-08-18 23:30:25
 * @create [2025-08-18 23:30:25] [lmx] [代码生成器生成]
 */
public interface MemberUserManager extends SuperCacheManager<MemberUser>, LoadService {

    /**
     * 重置密码错误次数
     *
     * @param id 用户id
     * @return 重置了多少行
     */
    int resetPassErrorNum(Long id);

    /**
     * 修改输错密码的次数
     *
     * @param id 用户Id
     */
    void incrPasswordErrorNumById(Long id);

    /**
     * 根据用户名查询用户
     *
     * @param username 用户名
     * @return
     */
    MemberUser getUserByUsername(String username);

    /**
     * 根据手机号查询用户
     *
     * @param mobile 手机号
     * @return
     */
    MemberUser getUserByMobile(String mobile);

    MemberUser getMemberUserByUser(Long userId);
}


