package cn.lmx.kpu.oauth.controller;

import cn.lmx.basic.base.R;
import cn.lmx.basic.exception.BizException;
import cn.lmx.kpu.oauth.service.UserInfoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 演示站点专用接口
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Slf4j
@RestController
@Tag(name = "演示站点专用接口")
@RequiredArgsConstructor
public class DemoSiteController {
    private final UserInfoService userInfoService;

    @Operation(summary = "注册临时管理员账号密码", description = "注册临时管理员账号密码")
    @PostMapping(value = "/anyTenant/registerTempAdmin")
    public R<Map<String, Object>> registerTempAdmin(@RequestParam String type) throws BizException {
        return R.success(userInfoService.registerTempAdmin(type));
    }
}
