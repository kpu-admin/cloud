package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.interfaces.echo.EchoService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopSysConfigService;
import cn.lmx.kpu.sop.admin.entity.SopSysConfig;
import cn.lmx.kpu.sop.admin.vo.save.SopSysConfigSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopSysConfigUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopSysConfigResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopSysConfigPageQuery;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * 系统配置表
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
@RequestMapping("/sopSysConfig")
@Tag(name = "系统配置表")
public class SopSysConfigController extends SuperController<SopSysConfigService, Long, SopSysConfig, SopSysConfigSaveVO, SopSysConfigUpdateVO, SopSysConfigPageQuery, SopSysConfigResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}


