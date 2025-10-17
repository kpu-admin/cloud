package cn.lmx.kpu.shop.vo.result.user;

import cn.hutool.core.map.MapUtil;
import cn.lmx.basic.annotation.echo.Echo;
import cn.lmx.basic.base.entity.Entity;
import cn.lmx.basic.interfaces.echo.EchoVO;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.model.constant.EchoDictType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Map;

/**
 * <p>
 * 表单查询方法返回值VO
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
@Schema(description = "商城用户")
public class MemberUserResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;

    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键id")
    private Long id;

    /**
    * 账号
    */
    @Schema(description = "账号")
    private String username;
    /**
    * 密码
    */
    @Schema(description = "密码")
    private String password;
    /**
    * 密码盐
    */
    @Schema(description = "密码盐")
    private String salt;
    /**
    * 真实姓名
    */
    @Schema(description = "真实姓名")
    private String realName;
    /**
    * 生日
    */
    @Schema(description = "生日")
    private String birthday;
    /**
    * 身份证号码
    */
    @Schema(description = "身份证号码")
    private String cardId;
    /**
    * 用户昵称
    */
    @Schema(description = "用户昵称")
    private String nickName;
    /**
    * 用户头像
    */
    @Schema(description = "用户头像")
    private String avatar;
    /**
    * 手机号码
    */
    @Schema(description = "手机号码")
    private String mobile;
    /**
    * 添加ip
    */
    @Schema(description = "添加ip")
    private String addIp;
    /**
    * 用户余额
    */
    @Schema(description = "用户余额")
    private BigDecimal nowMoney;
    /**
    * 用户剩余积分
    */
    @Schema(description = "用户剩余积分")
    private BigDecimal integral;
    /**
     * 等级
     */
    @Schema(description = "等级")
    private Integer level;
    /**
    * 密码过期时间
    */
    @Schema(description = "密码过期时间")
    private LocalDateTime passwordErrorLastTime;
    /**
    * 密码错误次数
    */
    @Schema(description = "密码错误次数")
    private Integer passwordErrorNum;
    /**
    * 状态;[0-禁用 1-正常]
    */
    @Schema(description = "状态")
    private Boolean state;
    /**
    * 用户类型
    */
    @Schema(description = "用户类型")
    private String userType;
    /**
    * 用户登陆类型;[h5 wechat outine]
    */
    @Schema(description = "用户登陆类型")
    private String loginType;
    /**
    * 性别;[0-未知 1-男 2-女 3-保密]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.SEX)
    */
    @Schema(description = "性别")
    @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.SEX)
    private String sex;
    /**
    * 国家;[中国-CN 其他-OTHER]
    */
    @Schema(description = "国家")
    private String country;

}
