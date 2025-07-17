package cn.lmx.kpu.sop.admin.vo.result;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.Accessors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@Builder
@Schema(description = "文档信息配置")
public class DocInfoConfigVO {
    private String openProdUrl;
    private String openSandboxUrl;
}
