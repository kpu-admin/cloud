package cn.lmx.kpu.shop.mapper.user;

import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

/**
 * <p>
 * Mapper 接口
 * 商城用户
 * </p>
 *
 * @author lmx
 * @date 2025-08-18 23:30:25
 * @create [2025-08-18 23:30:25] [lmx] [代码生成器生成]
 */
@Repository
public interface MemberUserMapper extends SuperMapper<MemberUser> {

    /**
     * 递增 密码错误次数
     *
     * @param id  用户id
     * @param now 当前时间
     * @return 被修改了几行数据
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    int incrPasswordErrorNumById(@Param("id") Long id, @Param("now") LocalDateTime now);

    /**
     * 重置 密码错误次数
     *
     * @param id  用户id
     * @param now 当前时间
     * @return 被修改了几行数据
     */
    int resetPassErrorNum(@Param("id") Long id, @Param("now") LocalDateTime now);
}


