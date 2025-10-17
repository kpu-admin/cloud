package cn.lmx.kpu.shop.entity.user;

import cn.lmx.basic.base.entity.Entity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import static cn.lmx.kpu.model.constant.Condition.LIKE;
import static com.baomidou.mybatisplus.annotation.SqlCondition.EQUAL;


/**
 * <p>
 * 实体类
 * 商城用户
 * </p>
 *
 * @author lmx
 * @date 2025-08-21 02:42:27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
@Builder
@TableName("shop_user")
public class MemberUser extends Entity<Long> {
    private static final long serialVersionUID = 1L;

    /**
     * 账号
     */
    @TableField(value = "username", condition = LIKE)
    private String username;
    /**
     * 密码
     */
    @TableField(value = "password", condition = LIKE)
    private String password;
    /**
     * 密码盐
     */
    @TableField(value = "salt", condition = LIKE)
    private String salt;
    /**
     * 真实姓名
     */
    @TableField(value = "real_name", condition = LIKE)
    private String realName;
    /**
     * 生日
     */
    @TableField(value = "birthday", condition = LIKE)
    private String birthday;
    /**
     * 身份证号码
     */
    @TableField(value = "card_id", condition = LIKE)
    private String cardId;
    /**
     * 用户昵称
     */
    @TableField(value = "nick_name", condition = LIKE)
    private String nickName;
    /**
     * 用户头像
     */
    @TableField(value = "avatar", condition = LIKE)
    private String avatar;
    /**
     * 手机号码
     */
    @TableField(value = "mobile", condition = LIKE)
    private String mobile;
    /**
     * 添加ip
     */
    @TableField(value = "add_ip", condition = LIKE)
    private String addIp;
    /**
     * 用户余额
     */
    @TableField(value = "now_money", condition = EQUAL)
    private BigDecimal nowMoney;
    /**
     * 用户剩余积分
     */
    @TableField(value = "integral", condition = EQUAL)
    private BigDecimal integral;
    /**
     * 等级
     */
    @Schema(description = "等级")
    private Integer level;
    /**
     * 密码过期时间
     */
    @TableField(value = "password_error_last_time", condition = EQUAL)
    private LocalDateTime passwordErrorLastTime;
    /**
     * 密码错误次数
     */
    @TableField(value = "password_error_num", condition = EQUAL)
    private Integer passwordErrorNum;
    /**
     * 状态;[0-禁用 1-正常]
     */
    @TableField(value = "state", condition = EQUAL)
    private Boolean state;
    /**
     * 用户类型
     */
    @TableField(value = "user_type", condition = LIKE)
    private String userType;
    /**
     * 用户登陆类型;[h5 wechat outine]
     */
    @TableField(value = "login_type", condition = LIKE)
    private String loginType;
    /**
     * 性别;[0-未知 1-男 2-女 3-保密]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.SEX)
     */
    @TableField(value = "sex", condition = LIKE)
    private String sex;
    /**
     * 国家;[中国-CN 其他-OTHER]
     */
    @TableField(value = "country", condition = LIKE)
    private String country;
    /**
     * 是否删除
     */
    @TableField(value = "is_deleted", condition = EQUAL)
    private Integer isDeleted;



}
