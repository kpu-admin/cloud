package cn.lmx.kpu.sop.admin.vo.save;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 表单保存方法VO
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
@EqualsAndHashCode
@Builder
@Schema(description = "isv分组")
public class SopPermIsvGroupSaveVO implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * ISV
     */
    @Schema(description = "ISV")
    @NotEmpty(message = "请填写ISV")
    @Size(max = 19, message = "ISV长度不能超过{max}")
    private String isvId;
    //    /**
//     * 分组 perm_group.id
//     */
//    @Schema(description = "分组 perm_group.id")
//    @NotEmpty(message = "请填写分组 perm_group.id")
//    @Size(max = 19, message = "分组 perm_group.id长度不能超过{max}")
//    private String groupId;
    @Schema(description = "分组")
    @NotNull(message = "请填写分组")
    private List<String> groupIdList;


}
