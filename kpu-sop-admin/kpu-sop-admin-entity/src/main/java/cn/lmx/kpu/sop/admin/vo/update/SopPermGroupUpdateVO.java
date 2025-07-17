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
 * 分组表
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
@Schema(description = "分组表")
public class SopPermGroupUpdateVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键id")
    @NotNull(message = "请填写主键id", groups = SuperEntity.Update.class)
    private Long id;

    /**
     * 分组描述
     */
    @Schema(description = "分组描述")
    @NotEmpty(message = "请填写分组描述")
    @Size(max = 64, message = "分组描述长度不能超过{max}")
    private String groupName;



}
