package cn.lmx.kpu.shop.vo.save.user;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 表单保存方法VO
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
@EqualsAndHashCode
@Builder
@Schema(description = "商城用户")
public class MemberUserSaveVO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 账号
     */
    @Schema(description = "账号")
    @Size(max = 32, message = "账号长度不能超过{max}")
    private String username;
    /**
     * 密码
     */
    @Schema(description = "密码")
    @Size(max = 64, message = "密码长度不能超过{max}")
    private String password;
    /**
     * 密码盐
     */
    @Schema(description = "密码盐")
    @Size(max = 20, message = "密码盐长度不能超过{max}")
    private String salt;
    /**
     * 真实姓名
     */
    @Schema(description = "真实姓名")
    @Size(max = 20, message = "真实姓名长度不能超过{max}")
    private String realName;
    /**
     * 生日
     */
    @Schema(description = "生日")
    @Size(max = 32, message = "生日长度不能超过{max}")
    private String birthday;
    /**
     * 身份证号码
     */
    @Schema(description = "身份证号码")
    @Size(max = 20, message = "身份证号码长度不能超过{max}")
    private String cardId;
    /**
     * 用户昵称
     */
    @Schema(description = "用户昵称")
    @Size(max = 32, message = "用户昵称长度不能超过{max}")
    private String nickName;
    /**
     * 用户头像
     */
    @Schema(description = "用户头像")
    @Size(max = 512, message = "用户头像长度不能超过{max}")
    private String avatar;
    /**
     * 手机号码
     */
    @Schema(description = "手机号码")
    @Size(max = 20, message = "手机号码长度不能超过{max}")
    private String mobile;

    /**
     * 状态;[0-禁用 1-正常]
     */
    @Schema(description = "状态")
    @NotNull(message = "请填写状态")
    private Boolean state;
    /**
     * 用户类型
     */
    @Schema(description = "用户类型")
    @Size(max = 2, message = "用户类型长度不能超过{max}")
    private String userType;
    /**
     * 用户登陆类型;[h5 wechat outine]
     */
    @Schema(description = "用户登陆类型")
    @Size(max = 2, message = "用户登陆类型长度不能超过{max}")
    private String loginType;
    /**
     * 性别;[0-未知 1-男 2-女 3-保密]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.SEX)
     */
    @Schema(description = "性别")
    @Size(max = 1, message = "性别长度不能超过{max}")
    private String sex;
    /**
     * 国家;[中国-CN 其他-OTHER]
     */
    @Schema(description = "国家")
    @Size(max = 10, message = "国家长度不能超过{max}")
    private String country;




}
