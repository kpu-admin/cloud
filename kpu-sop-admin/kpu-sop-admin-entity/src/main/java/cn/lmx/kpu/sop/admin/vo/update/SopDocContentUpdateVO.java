package cn.lmx.kpu.sop.admin.vo.update;

import cn.lmx.basic.base.entity.SuperEntity;
import io.swagger.v3.oas.annotations.media.Schema;
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
 * 文档内容
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@EqualsAndHashCode
@Builder
@Schema(description = "文档内容")
public class SopDocContentUpdateVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键id")
    @NotNull(message = "请填写主键id", groups = SuperEntity.Update.class)
    private Long id;

    /**
     * 文档ID doc_info.id
     */
    @Schema(description = "文档ID doc_info.id")
    @NotNull(message = "请填写文档ID doc_info.id")
    private Long docInfoId;
    /**
     * 文档内容
     */
    @Schema(description = "文档内容")
    @Size(max = 2147483647, message = "文档内容长度不能超过{max}")
    private String content;


}
