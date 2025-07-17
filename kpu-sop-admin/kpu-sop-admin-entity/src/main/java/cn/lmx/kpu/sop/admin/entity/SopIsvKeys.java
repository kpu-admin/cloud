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
@TableName("sop_isv_keys")
public class SopIsvKeys extends Entity<Long> {
    private static final long serialVersionUID = 1L;

    /**
     * ISV isv_info.id
     */
    @TableField(value = "isv_id", condition = EQUAL)
    private Long isvId;
    /**
     * 秘钥格式 [1-PKCS8(JAVA适用) 2-PKCS1(非JAVA适用)]
     */
    @TableField(value = "key_format", condition = EQUAL)
    private Integer keyFormat;
    /**
     * 开发者生成的公钥
     */
    @TableField(value = "public_key_isv", condition = LIKE)
    private String publicKeyIsv;
    /**
     * 开发者生成的私钥 （提供给开发者）
     */
    @TableField(value = "private_key_isv", condition = LIKE)
    private String privateKeyIsv;
    /**
     * 平台生成的公钥 （提供给开发者）
     */
    @TableField(value = "public_key_platform", condition = LIKE)
    private String publicKeyPlatform;
    /**
     * 平台生成的私钥
     */
    @TableField(value = "private_key_platform", condition = LIKE)
    private String privateKeyPlatform;



}
