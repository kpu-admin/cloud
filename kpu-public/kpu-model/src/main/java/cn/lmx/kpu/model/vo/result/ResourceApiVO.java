package cn.lmx.kpu.model.vo.result;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;

import static cn.lmx.kpu.model.constant.Condition.LIKE;

/**
 * <p>
 * 实体类
 * 资源接口
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@ToString(callSuper = true)
@EqualsAndHashCode(of = {"uri", "requestMethod"})
@Accessors(chain = true)
@AllArgsConstructor
public class ResourceApiVO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 请求类型
     */
    @TableField(value = "request_method", condition = LIKE)
    private String requestMethod;

    /**
     * 接口路径;kpu-cloud版：uri需要拼接上gateway中路径前缀
     * kpu-boot版: uri需要不需要拼接前缀
     */
    @TableField(value = "uri", condition = LIKE)
    private String uri;

    @TableField(value = "code", condition = LIKE)
    private String code;
}
