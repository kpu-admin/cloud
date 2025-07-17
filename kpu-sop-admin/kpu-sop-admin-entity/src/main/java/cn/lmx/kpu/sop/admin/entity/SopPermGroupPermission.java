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
import static com.baomidou.mybatisplus.annotation.SqlCondition.EQUAL;


/**
 * <p>
 * 实体类
 * 组权限表
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
@TableName("sop_perm_group_permission")
public class SopPermGroupPermission extends Entity<Long> {
    private static final long serialVersionUID = 1L;

    /**
     * 分组id perm_group.id
     */
    @TableField(value = "group_id", condition = EQUAL)
    private Long groupId;
    /**
     * 文档id api_info.id
     */
    @TableField(value = "api_id", condition = EQUAL)
    private Long apiId;
    /**
     * 是否删除
     */
    @TableField(value = "is_deleted", condition = EQUAL)
    private Integer isDeleted;



}
