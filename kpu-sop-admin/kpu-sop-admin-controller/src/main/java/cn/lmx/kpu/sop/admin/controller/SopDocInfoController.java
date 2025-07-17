package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.interfaces.echo.EchoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopDocInfoService;
import cn.lmx.kpu.sop.admin.entity.SopDocInfo;
import cn.lmx.kpu.sop.admin.vo.save.SopDocInfoSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopDocInfoUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopDocInfoResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopDocInfoPageQuery;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * 文档信息
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 * @create [2025-07-06 19:04:42] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/sopDocInfo")
@Tag(name = "文档信息")
public class SopDocInfoController extends SuperController<SopDocInfoService, Long, SopDocInfo, SopDocInfoSaveVO, SopDocInfoUpdateVO, SopDocInfoPageQuery, SopDocInfoResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    /**
     * 按树结构查询
     *
     * @param pageQuery 查询参数
     * @return 查询结果
     */
    @Operation(summary = "文档信息按树结构查询", description = "文档信息按树结构查询")
    @PostMapping("/tree")
    @WebLog("文档信息按树结构查询")
    public R<List<SopDocInfoResultVO>> tree(@RequestBody SopDocInfoPageQuery pageQuery) {
        return success(superService.findTree(pageQuery));
    }

    @PostMapping("/syncAppDoc")
    @Operation(summary = "文档信息同步应用文档", description = "文档信息同步应用文档")
    @WebLog("文档信息同步应用文档")
    public R<Boolean> syncAppDoc(@Validated @RequestBody SopDocInfoPageQuery param) {
        superService.syncAppDoc(param.getId());
        return R.success(true);
    }

    @PostMapping("/syncDoc")
    @Operation(summary = "文档信息同步文档", description = "文档信息同步文档")
    @WebLog("文档信息同步文档")
    public R<Boolean> syncDoc(@Validated @RequestBody SopDocInfoPageQuery param) {
        superService.syncDoc(param.getId());
        return R.success(true);
    }

    @PostMapping("/publish")
    @Operation(summary = "文档信息发布文档", description = "文档信息发布文档")
    @WebLog("文档信息发布文档")
    public R<Boolean> publish(SopDocInfoUpdateVO param) {
        boolean bol = superService.publish(param);
        return R.success(bol);
    }
}


