package cn.lmx.kpu.sop.admin.vo.result;

import cn.hutool.core.map.MapUtil;
import cn.lmx.basic.base.entity.Entity;
import cn.lmx.basic.interfaces.echo.EchoVO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Map;

/**
 * <p>
 * 表单查询方法返回值VO
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
@EqualsAndHashCode(callSuper = true)
@Builder
@Schema(description = "系统配置表")
public class SopSysConfigResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;
    @Builder.Default
    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键id")
    private Long id;

    /**
    * 配置key
    */
    @Schema(description = "配置key")
    private String configKey;
    /**
    * 配置值
    */
    @Schema(description = "配置值")
    private String configValue;
    /**
    * 备注
    */
    @Schema(description = "备注")
    private String remark;
    /**
    * 是否删除
    */
    @Schema(description = "是否删除")
    private Integer isDeleted;



}
