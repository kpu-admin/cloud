package cn.lmx.kpu.sop.admin.vo.update;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 表单修改方法VO
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
@EqualsAndHashCode
@Builder
@Schema(description = "表单修改方法VO")
public class SopIsvInfoUpdateKeysVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long isvId;

    /**
     * 秘钥格式，1：PKCS8(JAVA适用)，2：PKCS1(非JAVA适用)
     */
    private Integer keyFormat;

    /**
     * 开发者生成的公钥, 数据库字段：public_key_isv
     */
    private String publicKeyIsv;

    /**
     * 开发者生成的私钥（交给开发者）, 数据库字段：private_key_isv
     */
    private String privateKeyIsv;

    /**
     * 平台生成的公钥（交给开发者）, 数据库字段：public_key_platform
     */
    private String publicKeyPlatform;

    /**
     * 平台生成的私钥, 数据库字段：private_key_platform
     */
    private String privateKeyPlatform;

}
