package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.interfaces.echo.EchoService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopPermIsvGroupService;
import cn.lmx.kpu.sop.admin.entity.SopPermIsvGroup;
import cn.lmx.kpu.sop.admin.vo.save.SopPermIsvGroupSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopPermIsvGroupUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopPermIsvGroupResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopPermIsvGroupPageQuery;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * isv分组
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/sopPermIsvGroup")
@Tag(name = "isv分组")
public class SopPermIsvGroupController extends SuperController<SopPermIsvGroupService, Long, SopPermIsvGroup, SopPermIsvGroupSaveVO, SopPermIsvGroupUpdateVO, SopPermIsvGroupPageQuery, SopPermIsvGroupResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}


