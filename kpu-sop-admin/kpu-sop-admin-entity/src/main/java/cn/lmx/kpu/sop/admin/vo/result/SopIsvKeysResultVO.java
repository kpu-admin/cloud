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
 * ISV秘钥管理
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
@Schema(description = "ISV秘钥管理")
public class SopIsvKeysResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;
    @Builder.Default
    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键id")
    private Long id;

    /**
    * ISV isv_info.id
    */
    @Schema(description = "ISV isv_info.id")
    private Long isvId;
    /**
    * 秘钥格式 [1-PKCS8(JAVA适用) 2-PKCS1(非JAVA适用)]
    */
    @Schema(description = "秘钥格式 [1-PKCS8(JAVA适用) 2-PKCS1(非JAVA适用)]")
    private Integer keyFormat;
    /**
    * 开发者生成的公钥
    */
    @Schema(description = "开发者生成的公钥")
    private String publicKeyIsv;
    /**
    * 开发者生成的私钥 （提供给开发者）
    */
    @Schema(description = "开发者生成的私钥 （提供给开发者）")
    private String privateKeyIsv;
    /**
    * 平台生成的公钥 （提供给开发者）
    */
    @Schema(description = "平台生成的公钥 （提供给开发者）")
    private String publicKeyPlatform;
    /**
    * 平台生成的私钥
    */
    @Schema(description = "平台生成的私钥")
    private String privateKeyPlatform;

    /**
     * 应用id
     */
    @Schema(description = "应用id")
    private String appId;



}
