package cn.lmx.kpu.generator.controller;

import cn.lmx.basic.base.request.PageParams;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.generator.entity.DefGenTableColumn;
import cn.lmx.kpu.generator.service.DefGenTableColumnService;
import cn.lmx.kpu.generator.vo.query.DefGenTableColumnPageQuery;
import cn.lmx.kpu.generator.vo.result.DefGenTableColumnResultVO;
import cn.lmx.kpu.generator.vo.save.DefGenTableColumnSaveVO;
import cn.lmx.kpu.generator.vo.update.DefGenTableColumnUpdateVO;

/**
 * <p>
 * 前端控制器
 * 代码生成字段
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/defGenTableColumn")
@Tag(name = "代码生成字段")
public class DefGenTableColumnController extends SuperController<DefGenTableColumnService, Long, DefGenTableColumn, DefGenTableColumnSaveVO,
        DefGenTableColumnUpdateVO, DefGenTableColumnPageQuery, DefGenTableColumnResultVO> {
    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

//    @Override
//    public QueryWrap<DefGenTableColumn> handlerWrapper(DefGenTableColumn model, PageParams<DefGenTableColumnPageQuery> params) {
//        return super.handlerWrapper(model, params);
//    }

    /**
     * 分页查询
     *
     * @param params 分页参数
     * @return 分页数据s
     */
    @Override
    @WebLog(value = "'分页列表查询:第' + #params?.current + '页, 显示' + #params?.size + '行'", response = false)
    public R<IPage<DefGenTableColumnResultVO>> page(@RequestBody @Validated PageParams<DefGenTableColumnPageQuery> params) {
        IPage<DefGenTableColumnResultVO> page = superService.pageColumn(params);
        handlerResult(page);
        return R.success(page);
    }

    @Operation(summary = "同步字段结构", description = "同步字段结构")
    @PostMapping(value = "/syncField")
    @WebLog(value = "同步字段结构")
    public R<Boolean> syncField(@RequestParam Long tableId, @RequestParam Long id) {
        return R.success(superService.syncField(tableId, id));
    }
}


