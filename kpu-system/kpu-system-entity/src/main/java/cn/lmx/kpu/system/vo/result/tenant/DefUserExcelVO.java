package cn.lmx.kpu.system.vo.result.tenant;


import com.alibaba.excel.annotation.ExcelProperty;
import io.swagger.v3.oas.annotations.media.Schema;
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
 * 实体类
 * 用户
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = false)
@Builder
@Schema(description = "用户导出")
public class DefUserExcelVO implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * 用户名;大小写数字下划线
     */
    @Schema(description = "用户名")
    @ExcelProperty("用户名")
    private String username;
    /**
     * 昵称
     */
    @Schema(description = "昵称")
    @ExcelProperty("昵称")
    private String nickName;
    /**
     * 邮箱
     */
    @Schema(description = "邮箱")
    @ExcelProperty("邮箱")
    private String email;
    /**
     * 手机;1开头11位纯数字
     */
    @Schema(description = "手机")
    @ExcelProperty("手机")
    private String mobile;
    /**
     * 身份证;15或18位
     */
    @Schema(description = "身份证")
    @ExcelProperty("身份证")
    private String idCard;

}
