package cn.lmx.kpu.sop.admin.vo.update;

import cn.lmx.basic.base.entity.SuperEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
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
 * 组权限表
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
@Schema(description = "组权限表")
public class SopPermGroupPermissionUpdateVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键id")
    @NotNull(message = "请填写主键id", groups = SuperEntity.Update.class)
    private Long id;

    /**
     * 分组id perm_group.id
     */
    @Schema(description = "分组id perm_group.id")
    @NotNull(message = "请填写分组id perm_group.id")
    private Long groupId;
    /**
     * 文档id api_info.id
     */
    @Schema(description = "文档id api_info.id")
    @NotNull(message = "请填写文档id api_info.id")
    private Long apiId;
    /**
     * 是否删除
     */
    @Schema(description = "是否删除")
    @NotNull(message = "请填写是否删除")
    private Integer isDeleted;


}
