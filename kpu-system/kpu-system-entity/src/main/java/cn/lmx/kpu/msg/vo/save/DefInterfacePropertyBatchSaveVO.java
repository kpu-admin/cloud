package cn.lmx.kpu.msg.vo.save;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import cn.lmx.kpu.msg.vo.update.DefInterfacePropertyUpdateVO;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 表单保存方法VO
 * 接口属性
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
@Schema(description = "接口属性")
public class DefInterfacePropertyBatchSaveVO implements Serializable {

    private static final long serialVersionUID = 1L;
    @Valid
    private List<DefInterfacePropertySaveVO> insertRecords;
    @Valid
    private List<DefInterfacePropertyUpdateVO> updateRecords;
    @Valid
    private List<DefInterfacePropertyUpdateVO> removeRecords;
    @Valid
    private List<DefInterfacePropertyUpdateVO> pendingRecords;
}
