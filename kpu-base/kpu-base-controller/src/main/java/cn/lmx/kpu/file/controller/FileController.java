package cn.lmx.kpu.file.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.controller.DeleteController;
import cn.lmx.basic.base.controller.QueryController;
import cn.lmx.basic.base.controller.SuperSimpleController;
import cn.lmx.basic.base.request.PageParams;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.file.entity.File;
import cn.lmx.kpu.file.service.FileService;

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
@RequestMapping("/file")
@RequiredArgsConstructor
@Tag(name = "com_file表增删改")
public class FileController extends SuperSimpleController<FileService, Long, File>
        implements QueryController<Long, File, File, File>, DeleteController<Long, File> {

    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    @Override
    public Class<File> getResultVOClass() {
        return File.class;
    }

    @Override
    public void handlerQueryParams(PageParams<File> params) {
    }

//    @Override
//    public R<Boolean> handlerDelete(List<Long> longs) {
//        ContextUtil.setDefTenantId();
//        return R.successDef(true);
//    }
}
