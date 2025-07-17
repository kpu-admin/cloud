package cn.lmx.kpu.sop.admin.entity;

import cn.lmx.basic.base.entity.Entity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
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
 * isv信息表
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
@TableName("sop_isv_info")
public class SopIsvInfo extends Entity<Long> {
    private static final long serialVersionUID = 1L;

    /**
     * appKey
     */
    @TableField(value = "app_id", condition = LIKE)
    private String appId;
    /**
     * 状态 [1-启用 2-禁用]
     */
    @TableField(value = "status", condition = EQUAL)
    private Integer status;
    /**
     * 开始有效期
     */
    @TableField(value = "start_expiration_time", condition = EQUAL)
    private LocalDateTime startExpirationTime;
    /**
     * 结束有效期
     */
    @TableField(value = "end_expiration_time", condition = EQUAL)
    private LocalDateTime endExpirationTime;
    /**
     * 审核状态 [0-初始化 1-申请中 2-通过 99-退回]
     */
    @TableField(value = "audit_status", condition = EQUAL)
    private Integer auditStatus;
    /**
     * 审核时间
     */
    @TableField(value = "audit_time", condition = EQUAL)
    private LocalDateTime auditTime;
    /**
     * 提交时间
     */
    @TableField(value = "submission_time", condition = EQUAL)
    private LocalDateTime submissionTime;
    /**
     * 创建方式 [0-后台创建 1-用户申请]
     */
    @TableField(value = "creation_method", condition = EQUAL)
    private Integer creationMethod;
    /**
     * 审核意见
     */
    @TableField(value = "review_comments", condition = LIKE)
    private String reviewComments;
    /**
     * 租户id def_tenant.id
     */
    @TableField(value = "tenant_id", condition = EQUAL)
    private Long tenantId;
    /**
     * 名称
     */
    @TableField(value = "name", condition = LIKE)
    private String name;



}
