package cn.lmx.kpu.oauth.facde.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.oauth.facade.CaptchaFacade;
import cn.lmx.kpu.oauth.service.CaptchaService;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service
@RequiredArgsConstructor
public class CaptchaFacadeImpl implements CaptchaFacade {

    private final CaptchaService captchaService;

    public Boolean check(String key, String code, String templateCode) {
        R<Boolean> result = captchaService.checkCaptcha(key, code, templateCode);
        return result.getData();
    }
}
