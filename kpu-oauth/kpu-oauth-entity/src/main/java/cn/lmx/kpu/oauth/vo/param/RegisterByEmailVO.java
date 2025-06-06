package cn.lmx.kpu.oauth.vo.param;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import cn.lmx.basic.annotation.constraints.NotEmptyPattern;

import static cn.lmx.basic.utils.ValidatorUtil.REGEX_EMAIL;

/**
 * 登录参数
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = false)
@Schema(description = "注册")
public class RegisterByEmailVO extends RegisterVO {


    /**
     * 邮箱
     */
    @Schema(description = "邮箱")
    @Size(max = 255, message = "邮箱长度不能超过{max}")
    @NotEmptyPattern(regexp = REGEX_EMAIL, message = "请输入正确的邮箱地址")
    @NotEmpty(message = "请填写登录邮箱")
    private String email;
}
