package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.sop.admin.service.WebsiteService;
import cn.lmx.kpu.sop.admin.vo.result.DocInfoViewVO;
import cn.lmx.kpu.sop.admin.vo.result.SopDocAppResultVO;
import cn.lmx.kpu.sop.admin.vo.result.SopDocInfoResultVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/anyTenant/website")
@Tag(name = "网站", description = "网站")
public class WebsiteController {
    private final WebsiteService websiteService;


    /**
     * 获取文档应用列表
     */
    @Operation(summary = "获取文档应用列表", description = "获取文档应用列表")
    @WebLog("获取文档应用列表")
    @GetMapping("app/list")
    public R<List<SopDocAppResultVO>> listDocApp() {
        List<SopDocAppResultVO> sopDocAppResultVOS = websiteService.listDocApp();
        return R.success(sopDocAppResultVOS);
    }

    /**
     * 获取文档菜单树
     *
     * @param docAppId 应用id
     */
    @Operation(summary = "获取文档菜单树", description = "获取文档菜单树")
    @GetMapping("doc/tree")
    @WebLog("获取文档菜单树")
    public R<List<SopDocInfoResultVO>> listDocMenuTree(Long docAppId) {
        List<SopDocInfoResultVO> docInfoTreeDTOS = websiteService.listDocMenuTree(docAppId);
        return R.success(docInfoTreeDTOS);
    }

    /**
     * 获取文档详情
     *
     * @param id id
     */
    @Parameters({
            @Parameter(name = "id", description = "主键", schema = @Schema(type = "long"), in = ParameterIn.PATH),
    })
    @Operation(summary = "单体查询", description = "单体查询")
    @WebLog("'查询:' + #id")
    @GetMapping("doc/detail")
    public R<DocInfoViewVO> getDocDetail(Long id) {
        DocInfoViewVO docInfoViewVO = websiteService.getDocDetail(id);
        return R.success(docInfoViewVO);
    }

}
