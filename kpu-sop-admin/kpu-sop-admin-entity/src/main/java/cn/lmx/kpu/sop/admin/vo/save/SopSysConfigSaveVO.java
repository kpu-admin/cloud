package cn.lmx.kpu.sop.admin.vo.save;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import java.io.Serializable;

/**
 * <p>
 * 表单保存方法VO
 * 系统配置表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@EqualsAndHashCode
@Builder
@Schema(description = "系统配置表")
public class SopSysConfigSaveVO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 配置key
     */
    @Schema(description = "配置key")
    @NotEmpty(message = "请填写配置key")
    @Size(max = 64, message = "配置key长度不能超过{max}")
    private String configKey;
    /**
     * 配置值
     */
    @Schema(description = "配置值")
    @NotEmpty(message = "请填写配置值")
    @Size(max = 256, message = "配置值长度不能超过{max}")
    private String configValue;
    /**
     * 备注
     */
    @Schema(description = "备注")
    @Size(max = 128, message = "备注长度不能超过{max}")
    private String remark;

}
