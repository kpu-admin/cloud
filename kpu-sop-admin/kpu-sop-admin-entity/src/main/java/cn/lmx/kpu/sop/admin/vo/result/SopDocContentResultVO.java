package cn.lmx.kpu.sop.admin.vo.result;

import cn.hutool.core.map.MapUtil;
import cn.lmx.basic.base.entity.Entity;
import cn.lmx.basic.interfaces.echo.EchoVO;
import io.swagger.v3.oas.annotations.media.Schema;
import java.util.Map;
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
 * 表单查询方法返回值VO
 * 文档内容
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
@Schema(description = "文档内容")
public class SopDocContentResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;

    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键id")
    private Long id;

    /**
    * 文档ID doc_info.id
    */
    @Schema(description = "文档ID doc_info.id")
    private Long docInfoId;
    /**
    * 文档内容
    */
    @Schema(description = "文档内容")
    private String content;



}
