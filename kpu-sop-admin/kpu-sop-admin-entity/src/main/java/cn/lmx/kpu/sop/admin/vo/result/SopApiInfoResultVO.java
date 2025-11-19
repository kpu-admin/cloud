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
 * 接口信息表
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
@Schema(description = "接口信息表")
public class SopApiInfoResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;
    @Builder.Default
    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键id")
    private Long id;

    /**
    * 应用名称
    */
    @Schema(description = "应用名称")
    private String application;
    /**
    * 接口名称
    */
    @Schema(description = "接口名称")
    private String apiName;
    /**
    * 版本号
    */
    @Schema(description = "版本号")
    private String apiVersion;
    /**
    * 接口描述
    */
    @Schema(description = "接口描述")
    private String description;
    /**
    * 备注
    */
    @Schema(description = "备注")
    private String remark;
    /**
    * 接口class
    */
    @Schema(description = "接口class")
    private String interfaceClassName;
    /**
    * 方法名称
    */
    @Schema(description = "方法名称")
    private String methodName;
    /**
    * 参数信息
    */
    @Schema(description = "参数信息")
    private String paramInfo;
    /**
    * 接口是否需要授权访问
    */
    @Schema(description = "接口是否需要授权访问")
    private Integer isPermission;
    /**
    * 是否需要appAuthToken
    */
    @Schema(description = "是否需要appAuthToken")
    private Integer isNeedToken;
    /**
    * 是否有公共响应参数
    */
    @Schema(description = "是否有公共响应参数")
    private Integer hasCommonResponse;
    /**
    * 注册来源 [1-系统注册 2-手动注册]
    */
    @Schema(description = "注册来源 [1-系统注册 2-手动注册]")
    private Integer regSource;
    /**
    * 接口模式 [1-open接口 2-Restful模式]
    */
    @Schema(description = "接口模式 [1-open接口 2-Restful模式]")
    private Integer apiMode;
    /**
    * 状态 [1-启用 0-禁用]
    */
    @Schema(description = "状态 [1-启用 0-禁用]")
    private Integer status;



}
