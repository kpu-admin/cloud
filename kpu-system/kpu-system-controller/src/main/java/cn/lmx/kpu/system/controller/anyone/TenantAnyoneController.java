package cn.lmx.kpu.system.controller.anyone;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.file.service.AppendixService;
import cn.lmx.kpu.system.entity.application.DefApplication;
import cn.lmx.kpu.system.service.application.DefApplicationService;
import cn.lmx.kpu.system.vo.result.application.DefApplicationResultVO;

import java.util.List;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/anyone")
@Tag(name = "需要登录但无需验证uri权限的接口")
public class TenantAnyoneController {

    private final DefApplicationService defApplicationService;
    private final EchoService echoService;
    private final AppendixService appendixService;


    @Operation(summary = "设置我的默认应用")
    @PostMapping("/updateDefApp")
    @WebLog(value = "设置我的默认应用")
    public R<Boolean> updateDefApp(@RequestParam Long applicationId) {
        return R.success(defApplicationService.updateDefApp(applicationId, ContextUtil.getUserId()));
    }

    @Operation(summary = "查询我的默认应用")
    @GetMapping("/getDefApp")
    @WebLog(value = "查询我的默认应用")
    public R<DefApplication> getDefApp() {
        return R.success(defApplicationService.getDefApp(ContextUtil.getUserId()));
    }

    @Operation(summary = "查询我的应用")
    @GetMapping("/findMyApplication")
    @WebLog(value = "查询我的应用")
    public R<List<DefApplicationResultVO>> findMyApplication(@RequestParam(required = false) String name) {
        List<DefApplicationResultVO> list = defApplicationService.findMyApplication(name);
        echoService.action(list);
        appendixService.echoAppendix(list);
        return R.success(list);
    }

    @Operation(summary = "查询推荐应用")
    @GetMapping("/findRecommendApplication")
    @WebLog(value = "查询推荐应用")
    public R<List<DefApplicationResultVO>> findRecommendApplication(@RequestParam(required = false) String name) {
        List<DefApplicationResultVO> list = defApplicationService.findRecommendApplication(name);
        echoService.action(list);
        appendixService.echoAppendix(list);
        return R.success(list);
    }

}
