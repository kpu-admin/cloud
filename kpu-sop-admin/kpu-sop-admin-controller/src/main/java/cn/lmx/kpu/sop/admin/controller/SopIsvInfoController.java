package cn.lmx.kpu.sop.admin.controller;

import cn.lmx.basic.base.R;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.common.utils.RSATool;
import cn.lmx.kpu.sop.admin.eunm.AuditStatusEnum;
import cn.lmx.kpu.sop.admin.vo.query.SopIsvKeysPageQuery;
import cn.lmx.kpu.sop.admin.vo.result.SopIsvKeysResultVO;
import cn.lmx.kpu.sop.admin.vo.update.SopIsvInfoUpdateKeysVO;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopIsvInfoService;
import cn.lmx.kpu.sop.admin.entity.SopIsvInfo;
import cn.lmx.kpu.sop.admin.vo.save.SopIsvInfoSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopIsvInfoUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopIsvInfoResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopIsvInfoPageQuery;

/**
 * <p>
 * 前端控制器
 * isv信息表
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
@RequestMapping("/sopIsvInfo")
@Tag(name = "isv信息表")
public class SopIsvInfoController extends SuperController<SopIsvInfoService, Long, SopIsvInfo, SopIsvInfoSaveVO, SopIsvInfoUpdateVO, SopIsvInfoPageQuery, SopIsvInfoResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    /**
     * 生成秘钥
     *
     * @param param
     * @return
     * @throws Exception
     */
    @PostMapping("createKeys")
    public R<RSATool.KeyStore> createKeys(@Validated @RequestBody SopIsvKeysPageQuery param) throws Exception {
        RSATool.KeyFormat format = RSATool.KeyFormat.of(param.getKeyFormat());
        RSATool.KeyStore keyStore = superService.createKeys(format);
        return R.success(keyStore);
    }

    /**
     * 获取秘钥信息
     *
     * @param isvId
     * @return
     */
    @GetMapping("/getKeys")
    public R<SopIsvKeysResultVO> getKeys(Long isvId) {
        SopIsvKeysResultVO isvKeysDTO = superService.getKeys(isvId);
        return R.success(isvKeysDTO);
    }
    /**
     * 修改秘钥
     *
     * @param param 表单数据
     * @return 返回影响行数
     */
    @PostMapping("/updateKeys")
    public R<Boolean> updateKeys(@Validated @RequestBody SopIsvInfoUpdateKeysVO param) {
        return R.success(superService.updateKeys(param));
    }
}


