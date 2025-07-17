package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.interfaces.echo.EchoService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopIsvKeysService;
import cn.lmx.kpu.sop.admin.entity.SopIsvKeys;
import cn.lmx.kpu.sop.admin.vo.save.SopIsvKeysSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopIsvKeysUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopIsvKeysResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopIsvKeysPageQuery;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * ISV秘钥管理
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
@RequestMapping("/sopIsvKeys")
@Tag(name = "ISV秘钥管理")
public class SopIsvKeysController extends SuperController<SopIsvKeysService, Long, SopIsvKeys, SopIsvKeysSaveVO, SopIsvKeysUpdateVO, SopIsvKeysPageQuery, SopIsvKeysResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}


