package cn.lmx.kpu.shop.granter;

import cn.lmx.basic.base.R;
import cn.lmx.basic.exception.BizException;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.basic.utils.StrHelper;
import cn.lmx.kpu.shop.event.LoginEvent;
import cn.lmx.kpu.shop.event.model.LoginStatusDTO;
import cn.lmx.kpu.shop.service.CaptchaService;
import cn.lmx.kpu.shop.vo.param.LoginParamVO;
import cn.lmx.kpu.shop.vo.result.oauth.LoginResultVO;
import cn.lmx.kpu.system.enumeration.system.LoginStatusEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 验证码TokenMemberGranter
 *
 * @author lmx
 */
@Component(CaptchaTokenMemberGranter.GRANT_TYPE)
@Slf4j
@RequiredArgsConstructor
public class CaptchaTokenMemberGranter extends PasswordTokenMemberGranter implements TokenMemberGranter {

    public static final String GRANT_TYPE = "CAPTCHA";
    private final CaptchaService captchaService;

    @Override
    protected R<LoginResultVO> checkCaptcha(LoginParamVO loginParam) {
        if (systemProperties.getVerifyCaptcha()) {
            R<Boolean> check = captchaService.checkCaptcha(loginParam.getKey(), GRANT_TYPE, loginParam.getCode());
            if (!check.getIsSuccess()) {
                String msg = check.getMsg();
                SpringUtils.publishEvent(new LoginEvent(LoginStatusDTO.fail(loginParam.getUsername(), LoginStatusEnum.CAPTCHA_ERROR, msg)));
                throw BizException.validFail(check.getMsg());
            }
        }
        return R.success(null);
    }

    @Override
    public R<LoginResultVO> checkParam(LoginParamVO loginParam) {
        String username = loginParam.getUsername();
        String password = loginParam.getPassword();
        if (StrHelper.isAnyBlank(username, password)) {
            return R.fail("请输入用户名或密码");
        }
        if (StrHelper.isAnyBlank(loginParam.getCode(), loginParam.getKey())) {
            return R.fail("请输入验证码");
        }

        return R.success(null);
    }

}
