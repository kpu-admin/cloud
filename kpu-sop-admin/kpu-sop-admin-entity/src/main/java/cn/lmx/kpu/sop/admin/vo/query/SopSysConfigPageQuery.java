package cn.lmx.kpu.sop.admin.vo.query;

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
 * 表单查询条件VO
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
@EqualsAndHashCode
@Builder
@Schema(description = "系统配置表")
public class SopSysConfigPageQuery implements Serializable {

    private static final long serialVersionUID = 1L;

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
