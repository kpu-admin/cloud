package cn.lmx.kpu.system.vo.update.tenant;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import cn.lmx.basic.annotation.constraints.NotEmptyPattern;

import java.io.Serializable;

import static cn.lmx.basic.utils.ValidatorUtil.REGEX_PASSWORD;

/**
 * <p>
 * 用户密码修改VO
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = false)
@Builder
@Schema(description = "管理员重置用户密码VO")
public class DefUserPasswordResetVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键")
    @NotNull(message = "id不能为空")
    private Long id;

    @Schema(description = "是否使用系统内置密码")
    @NotNull(message = "请选择是否使用系统内置密码")
    private Boolean isUseSystemPassword;
    /**
     * 密码
     */
    @Schema(description = "密码")
    @Size(min = 6, max = 20, message = "密码长度不能小于{min}且超过{max}个字符")
    @NotEmptyPattern(regexp = REGEX_PASSWORD, message = "至少包含字母、数字、特殊字符")
    private String password;

    /**
     * 密码
     */
    @Schema(description = "确认密码")
    @Size(min = 6, max = 20, message = "密码长度不能小于{min}且超过{max}个字符")
    private String confirmPassword;

}
