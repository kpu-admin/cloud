package cn.lmx.kpu.sop.admin.vo.result;

import cn.hutool.core.map.MapUtil;
import cn.lmx.basic.base.entity.Entity;
import cn.lmx.basic.interfaces.echo.EchoVO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Map;

/**
 * <p>
 * 表单查询方法返回值VO
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
@Schema(description = "isv信息表")
public class SopIsvInfoResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;
    @Builder.Default
    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键id")
    private Long id;

    /**
    * appKey
    */
    @Schema(description = "appKey")
    private String appId;
    /**
    * 状态 [1-启用 2-禁用]
    */
    @Schema(description = "状态 [1-启用 2-禁用]")
    private Integer status;
    /**
    * 开始有效期
    */
    @Schema(description = "开始有效期")
    private LocalDateTime startExpirationTime;
    /**
    * 结束有效期
    */
    @Schema(description = "结束有效期")
    private LocalDateTime endExpirationTime;
    /**
    * 审核状态 [0-初始化 1-申请中 2-通过 99-退回]
    */
    @Schema(description = "审核状态 [0-初始化 1-申请中 2-通过 99-退回]")
    private Integer auditStatus;
    /**
    * 审核时间
    */
    @Schema(description = "审核时间")
    private LocalDateTime auditTime;
    /**
    * 提交时间
    */
    @Schema(description = "提交时间")
    private LocalDateTime submissionTime;
    /**
    * 创建方式 [0-后台创建 1-用户申请]
    */
    @Schema(description = "创建方式 [0-后台创建 1-用户申请]")
    private Integer creationMethod;
    /**
    * 审核意见
    */
    @Schema(description = "审核意见")
    private String reviewComments;
    /**
    * 租户id def_tenant.id
    */
    @Schema(description = "租户id def_tenant.id")
    private Long tenantId;
    /**
    * 名称
    */
    @Schema(description = "名称")
    private String name;



}
