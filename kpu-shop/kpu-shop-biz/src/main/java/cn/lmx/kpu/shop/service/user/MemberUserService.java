package cn.lmx.kpu.shop.service.user;

import cn.lmx.basic.base.service.SuperCacheService;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.system.vo.update.tenant.DefUserAvatarUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserBaseInfoUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserMobileUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserPasswordUpdateVO;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;


/**
 * <p>
 * 业务接口
 * 商城用户
 * </p>
 *
 * @author lmx
 * @date 2025-08-18 23:30:25
 * @create [2025-08-18 23:30:25] [lmx] [代码生成器生成]
 */
public interface MemberUserService extends SuperCacheService<Long, MemberUser> {

    /**
     * 根据id查询待回显参数
     *
     * @param ids 唯一键（可能不是主键ID)
     * @return
     */
    Map<Serializable, Object> findByIds(Set<Serializable> ids);

    /**
     * 注册
     *
     * @param memberUser
     * @return
     */
    String register(MemberUser memberUser);

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
     * 检测 手机号 是否可用
     *
     * @param mobile 手机号
     * @param id     用户id
     * @return boolean
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    boolean checkMobile(String mobile, Long id);

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

    /**
     * 修改头像
     *
     * @param data 头像信息
     * @return 是否修改成功
     */
    Boolean updateAvatar(DefUserAvatarUpdateVO data);

    /**
     * 修改密码
     *
     * @param data 密码信息
     * @return 是否修改成功
     */
    Boolean updatePassword(DefUserPasswordUpdateVO data);

    /**
     * 修改手机
     *
     * @param data 信息
     * @return 是否修改成功
     */
    Boolean updateMobile(DefUserMobileUpdateVO data);

    /**
     * 修改个人信息
     *
     * @param data 个人信息
     * @return 是否修改成功
     */
    Boolean updateBaseInfo(DefUserBaseInfoUpdateVO data);

    MemberUser getMemberUserByUser(Long userId);

    Long getUIdByUserId(Long id);
}


