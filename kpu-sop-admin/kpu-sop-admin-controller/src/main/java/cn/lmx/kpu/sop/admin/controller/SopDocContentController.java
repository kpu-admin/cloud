package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.interfaces.echo.EchoService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopDocContentService;
import cn.lmx.kpu.sop.admin.entity.SopDocContent;
import cn.lmx.kpu.sop.admin.vo.save.SopDocContentSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopDocContentUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopDocContentResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopDocContentPageQuery;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * 文档内容
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
@RequestMapping("/sopDocContent")
@Tag(name = "文档内容")
public class SopDocContentController extends SuperController<SopDocContentService, Long, SopDocContent, SopDocContentSaveVO, SopDocContentUpdateVO, SopDocContentPageQuery, SopDocContentResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}


