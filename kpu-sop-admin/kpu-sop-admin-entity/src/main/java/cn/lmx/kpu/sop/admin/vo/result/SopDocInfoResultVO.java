package cn.lmx.kpu.sop.admin.vo.result;

import cn.hutool.core.map.MapUtil;
import cn.lmx.basic.base.entity.Entity;
import cn.lmx.basic.interfaces.echo.EchoVO;
import cn.lmx.kpu.common.support.TreeNode;
import io.swagger.v3.oas.annotations.media.Schema;
import java.util.List;
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
 * 文档信息
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
@Schema(description = "文档信息")
public class SopDocInfoResultVO extends Entity<Long> implements Serializable, EchoVO, TreeNode<SopDocInfoResultVO, Long> {

    private static final long serialVersionUID = 1L;

    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键id")
    private Long id;

    /**
    * 应用id doc_app.id
    */
    @Schema(description = "应用id doc_app.id")
    private Long docAppId;
    /**
    * 文档标题
    */
    @Schema(description = "文档标题")
    private String docTitle;
    /**
    * 文档id torna.doc_info.id
    */
    @Schema(description = "文档id torna.doc_info.id")
    private Long docId;
    /**
    * 文档编码
    */
    @Schema(description = "文档编码")
    private String docCode;
    /**
    * 文档类型 [1-dubbo 2-富文本 3-Markdown]
    */
    @Schema(description = "文档类型 [1-dubbo 2-富文本 3-Markdown]")
    private Integer docType;
    /**
    * 来源类型 [01-torna 02-自建]
    */
    @Schema(description = "来源类型 [01-torna 02-自建]")
    private String sourceType;
    /**
    * 文档版本号
    */
    @Schema(description = "文档版本号")
    private String docVersion;
    /**
    * 文档名称
    */
    @Schema(description = "文档名称")
    private String docName;
    /**
    * 描述
    */
    @Schema(description = "描述")
    private String description;
    /**
    * 是否分类
    */
    @Schema(description = "是否分类")
    private Integer isFolder;
    /**
    * 状态 [0-未发布 1-已发布]
    */
    @Schema(description = "状态 [0-未发布 1-已发布]")
    private Integer isPublish;
    /**
    * 父文档节点id
    */
    @Schema(description = "父文档节点id")
    private Long parentId;

    private List<SopDocInfoResultVO> children;

    @Override
    public void setChildren(List<SopDocInfoResultVO> children) {
        this.children = children;
    }
    @Override
    public Long takeId() {
        return docId;
    }

    @Override
    public Long takeParentId() {
        return parentId;
    }



}
