package cn.lmx.kpu.sop.admin.entity;

import cn.lmx.basic.base.entity.Entity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import static cn.lmx.kpu.model.constant.Condition.LIKE;
import static com.baomidou.mybatisplus.annotation.SqlCondition.EQUAL;


/**
 * <p>
 * 实体类
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
@EqualsAndHashCode(callSuper = true)
@Builder
@TableName("sop_doc_content")
public class SopDocContent extends Entity<Long> {
    private static final long serialVersionUID = 1L;

    /**
     * 文档ID doc_info.id
     */
    @TableField(value = "doc_info_id", condition = EQUAL)
    private Long docInfoId;
    /**
     * 文档内容
     */
    @TableField(value = "content", condition = LIKE)
    private String content;



}
