package cn.lmx.kpu.base.vo.result.user;


import cn.hutool.core.map.MapUtil;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import cn.lmx.basic.base.entity.Entity;
import cn.lmx.basic.interfaces.echo.EchoVO;

import java.io.Serializable;
import java.util.Map;

/**
 * <p>
 * 实体类
 * 员工所在部门
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
@Schema(description = "员工所在部门")
public class BaseEmployeeOrgRelResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;
    @Builder.Default
    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键")
    private Long id;

    /**
     * 机构ID
     */
    @Schema(description = "机构ID")
    
    private Long orgId;
    /**
     * 员工ID
     */
    @Schema(description = "员工ID")
    
    private Long employeeId;
}
