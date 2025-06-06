package cn.lmx.kpu.msg.vo.save;

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
import java.time.LocalDateTime;

/**
 * <p>
 * 表单保存方法VO
 * 接口执行日志
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@EqualsAndHashCode
@Builder
@Schema(description = "接口执行日志")
public class ExtendInterfaceLogSaveVO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 接口ID;
     * #extend_interface
     */
    @Schema(description = "接口ID")
    @NotNull(message = "请填写接口ID")
    private Long interfaceId;
    /**
     * 接口名称
     */
    @Schema(description = "接口名称")
    @NotEmpty(message = "请填写接口名称")
    @Size(max = 255, message = "接口名称长度不能超过{max}")
    private String name;
    /**
     * 成功次数
     */
    @Schema(description = "成功次数")
    private Integer successCount;
    /**
     * 失败次数
     */
    @Schema(description = "失败次数")
    private Integer failCount;
    /**
     * 最后执行时间
     */
    @Schema(description = "最后执行时间")
    private LocalDateTime lastExecTime;


}
