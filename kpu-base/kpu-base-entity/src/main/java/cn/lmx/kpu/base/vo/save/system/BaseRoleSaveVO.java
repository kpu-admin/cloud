package cn.lmx.kpu.base.vo.save.system;

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
 * 实体类
 * 角色
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
@Schema(description = "角色")
public class BaseRoleSaveVO implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * 名称
     */
    @Schema(description = "名称")
    @NotEmpty(message = "请填写名称")
    @Size(max = 50, message = "名称长度不能超过{max}")
    private String name;
    /**
     * 编码
     */
    @Schema(description = "编码")
    @NotEmpty(message = "请填写编码")
    @Size(max = 20, message = "编码长度不能超过{max}")
    private String code;
    /**
     * 备注
     */
    @Schema(description = "备注")
    @Size(max = 255, message = "备注长度不能超过{max}")
    private String remarks;
    /**
     * 状态
     */
    @Schema(description = "状态")
    private Boolean state;

    /**
     * 角色类别;[10-功能角色 20-桌面角色 30-数据角色]
     */
    @Schema(description = "角色类别")
    @Size(max = 2, message = "角色类别长度不能超过{max}")
    @NotEmpty(message = "请填写角色类别")
    private String category;

}
