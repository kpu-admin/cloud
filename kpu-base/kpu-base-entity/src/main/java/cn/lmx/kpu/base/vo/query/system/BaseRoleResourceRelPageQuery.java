package cn.lmx.kpu.base.vo.query.system;

import io.swagger.v3.oas.annotations.media.Schema;
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
 * 角色的资源
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
@Schema(description = "角色的资源")
public class BaseRoleResourceRelPageQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 资源id;#def_resource
     */
    @Schema(description = "资源id")
    private Long resourceId;
    /**
     * 角色id;#base_role
     */
    @Schema(description = "角色id")
    private Long roleId;
    /**
     * 组织ID
     */
    @Schema(description = "组织ID")
    private Long orgId;

}
