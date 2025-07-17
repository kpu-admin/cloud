package cn.lmx.kpu.sop.admin.vo.update;

import cn.lmx.basic.base.entity.SuperEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
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
 * 表单修改方法VO
 * 文档应用
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@EqualsAndHashCode
@Builder
@Schema(description = "文档应用")
public class SopDocAppUpdateVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键id")
    @NotNull(message = "请填写主键id", groups = SuperEntity.Update.class)
    private Long id;

    /**
     * 应用名称
     */
    @Schema(description = "应用名称")
    @NotEmpty(message = "请填写应用名称")
    @Size(max = 64, message = "应用名称长度不能超过{max}")
    private String appName;
    /**
     * Torna应用token
     */
    @Schema(description = "Torna应用token")
    @NotEmpty(message = "请填写Torna应用token")
    @Size(max = 64, message = "Torna应用token长度不能超过{max}")
    private String token;
    /**
     * 是否发布
     */
    @Schema(description = "是否发布")
    private Long isPublish;


}
