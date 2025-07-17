package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.interfaces.echo.EchoService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopDocAppService;
import cn.lmx.kpu.sop.admin.entity.SopDocApp;
import cn.lmx.kpu.sop.admin.vo.save.SopDocAppSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopDocAppUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopDocAppResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopDocAppPageQuery;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * 文档应用
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
@RequestMapping("/sopDocApp")
@Tag(name = "文档应用")
public class SopDocAppController extends SuperController<SopDocAppService, Long, SopDocApp, SopDocAppSaveVO, SopDocAppUpdateVO, SopDocAppPageQuery, SopDocAppResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }
}


