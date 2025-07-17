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
public class SopPermGroupPageQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键id")
    private Long id;

    /**
    * 分组描述
    */
    @Schema(description = "分组描述")
    private String groupName;
    /**
    * 是否删除
    */
    @Schema(description = "是否删除")
    private Integer isDeleted;



}
