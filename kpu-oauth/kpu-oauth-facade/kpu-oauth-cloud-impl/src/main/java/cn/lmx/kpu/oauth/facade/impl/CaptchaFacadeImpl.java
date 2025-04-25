package cn.lmx.kpu.oauth.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.oauth.api.CaptchaApi;
import cn.lmx.kpu.oauth.facade.CaptchaFacade;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service
@RequiredArgsConstructor
public class CaptchaFacadeImpl implements CaptchaFacade {
    @Autowired
    @Lazy  // 一定要延迟加载，否则kpu-gateway-server无法启动
    private CaptchaApi captchaApi;

    public Boolean check(String key, String code, String templateCode) {
        R<Boolean> check = captchaApi.check(key, code, templateCode);
        return check.getData();
    }
}
