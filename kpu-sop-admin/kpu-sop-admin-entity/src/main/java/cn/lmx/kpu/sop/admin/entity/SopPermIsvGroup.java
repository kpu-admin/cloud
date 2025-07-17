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
 * isv分组
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
@TableName("sop_perm_isv_group")
public class SopPermIsvGroup extends Entity<Long> {
    private static final long serialVersionUID = 1L;

    /**
     * 是否删除
     */
    @TableField(value = "is_deleted", condition = EQUAL)
    private Integer isDeleted;
    /**
     * ISV
     */
    @TableField(value = "isv_id", condition = LIKE)
    private String isvId;
    /**
     * 分组 perm_group.id
     */
    @TableField(value = "group_id", condition = LIKE)
    private Long groupId;



}
