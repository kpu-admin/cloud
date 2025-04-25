package cn.lmx.kpu.file.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.file.service.AppendixService;
import cn.lmx.kpu.file.service.FileService;
import cn.lmx.kpu.file.vo.result.FileResultVO;
import cn.lmx.kpu.model.vo.result.AppendixResultVO;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * 增量文件上传日志
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("/anyone")
@Tag(name = "业务附件")
public class AppendixController {

    private final AppendixService appendixService;
    private final FileService fileService;

    /**
     * 根据业务id 和 业务类型附件信息
     *
     * @param bizId   业务id
     * @param bizType 业务类型
     */
    @Operation(summary = "根据业务id 和 业务类型查询附件信息", description = "根据业务id 和 业务类型查询文件信息")
    @PostMapping(value = "/appendix/listByBizId")
    @WebLog("根据业务id 和 业务类型查询附件信息")
    public R<List<AppendixResultVO>> listByBizId(@RequestParam Long bizId, @RequestParam(required = false) String bizType) {
        return R.success(appendixService.listByBizIdAndBizType(bizId, bizType));
    }

    @Operation(summary = "根据业务id 和 业务类型查询文件信息", description = "根据业务id 和 业务类型查询文件信息")
    @PostMapping(value = "/appendix/listFileByBizId")
    @WebLog("根据业务id 和 业务类型查询附件信息")
    public R<List<FileResultVO>> listFileByBizId(@RequestParam Long bizId, @RequestParam(required = false) String bizType) {
        return R.success(fileService.listByBizIdAndBizType(bizId, bizType));
    }

}
