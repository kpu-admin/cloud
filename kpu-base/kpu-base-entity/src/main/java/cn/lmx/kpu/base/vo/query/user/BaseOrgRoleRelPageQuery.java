package cn.lmx.kpu.base.vo.query.user;

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
 * 组织的角色
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
@Schema(description = "组织的角色")
public class BaseOrgRoleRelPageQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 部门;#base_org
     */
    @Schema(description = "部门")
    private Long orgId;
    /**
     * 角色;#base_role
     */
    @Schema(description = "角色")
    private Long roleId;

}
