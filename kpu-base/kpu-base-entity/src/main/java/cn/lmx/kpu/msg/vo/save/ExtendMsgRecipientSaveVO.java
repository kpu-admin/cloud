package cn.lmx.kpu.msg.vo.save;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 表单保存方法VO
 * 消息接收人
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@EqualsAndHashCode
@Builder
@Schema(description = "消息接收人")
public class ExtendMsgRecipientSaveVO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 接收人;
     * 可能是手机号、邮箱、用户ID等
     */
    @Schema(description = "接收人")
    @NotEmpty(message = "请填写接收人")
    @Size(max = 255, message = "接收人长度不能超过{max}")
    private String recipient;

    @Schema(description = "扩展信息")
    @Size(max = 255, message = "扩展信息不能超过{max}")
    private String ext;


}
