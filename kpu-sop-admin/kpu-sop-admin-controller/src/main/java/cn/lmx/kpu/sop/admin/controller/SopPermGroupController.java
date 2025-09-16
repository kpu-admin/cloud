package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.sop.admin.vo.save.SopPermIsvGroupSaveVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopPermGroupService;
import cn.lmx.kpu.sop.admin.entity.SopPermGroup;
import cn.lmx.kpu.sop.admin.vo.save.SopPermGroupSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopPermGroupUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopPermGroupResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopPermGroupPageQuery;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * 分组表
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
@RequestMapping("/sopPermGroup")
@Tag(name = "分组表")
public class SopPermGroupController extends SuperController<SopPermGroupService, Long, SopPermGroup, SopPermGroupSaveVO, SopPermGroupUpdateVO, SopPermGroupPageQuery, SopPermGroupResultVO> {
    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    @Operation(summary = "查询开发应用分组")
    @GetMapping("/listByGroupId")
    @WebLog(value = "查询开发应用分组", request = false)
    public R<List<Long>> listByGroupId(String isvId) {
        return R.success(superService.listByGroupId(isvId));
    }

    @Operation(summary = "修改开发应用分组")
    @PostMapping("/updateIsvGroup")
    @WebLog(value = "修改开发应用分组", request = false)
    public R<Boolean> updateIsvGroup(@Validated @RequestBody SopPermIsvGroupSaveVO param) {
        superService.updateIsvGroup(param);
        return R.success(true);
    }
}


