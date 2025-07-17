package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.base.R;
import cn.lmx.basic.interfaces.echo.EchoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopPermGroupPermissionService;
import cn.lmx.kpu.sop.admin.entity.SopPermGroupPermission;
import cn.lmx.kpu.sop.admin.vo.save.SopPermGroupPermissionSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopPermGroupPermissionUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopPermGroupPermissionResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopPermGroupPermissionPageQuery;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * 组权限表
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
@RequestMapping("/sopPermGroupPermission")
@Tag(name = "组权限表")
public class SopPermGroupPermissionController extends SuperController<SopPermGroupPermissionService, Long, SopPermGroupPermission, SopPermGroupPermissionSaveVO, SopPermGroupPermissionUpdateVO, SopPermGroupPermissionPageQuery, SopPermGroupPermissionResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    /**
     * 删除
     *
     * @param param 删除参数
     * @return 实体
     */
    @Operation(summary = "删除")
    @PostMapping("/delete")
    public R<Boolean> delete(@Validated @RequestBody SopPermGroupPermissionSaveVO param) {
        superService.delete(param);
        return R.success(true);
    }
}


