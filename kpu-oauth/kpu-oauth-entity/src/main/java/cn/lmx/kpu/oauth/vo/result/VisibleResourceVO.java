package cn.lmx.kpu.oauth.vo.result;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import cn.lmx.kpu.base.vo.result.user.VueRouter;

import java.io.Serializable;
import java.util.List;

/**
 * 拥有拥有的权限资源
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
@Builder
@Schema(description = "权限资源")
public class VisibleResourceVO implements Serializable {
    @Schema(description = "是否启用URI/按钮权限")
    private Boolean enabled;
    @Schema(description = "是否区分大小写")
    private Boolean caseSensitive;
    @Schema(description = "拥有的资源编码")
    private List<String> resourceList;
    @Schema(description = "拥有的菜单路由")
    private List<VueRouter> routerList;
    @Schema(description = "拥有的角色编码")
    private List<String> roleList;
}
