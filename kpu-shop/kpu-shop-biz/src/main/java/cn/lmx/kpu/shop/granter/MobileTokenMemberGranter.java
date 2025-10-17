package cn.lmx.kpu.shop.granter;

import cn.lmx.basic.base.R;
import cn.lmx.basic.exception.BizException;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.basic.utils.StrHelper;
import cn.lmx.kpu.model.enumeration.base.MsgTemplateCodeEnum;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.shop.event.LoginEvent;
import cn.lmx.kpu.shop.event.model.LoginStatusDTO;
import cn.lmx.kpu.shop.service.CaptchaService;
import cn.lmx.kpu.shop.service.user.MemberUserService;
import cn.lmx.kpu.shop.vo.param.LoginParamVO;
import cn.lmx.kpu.shop.vo.result.oauth.LoginResultVO;
import cn.lmx.kpu.system.enumeration.system.LoginStatusEnum;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;


/**
 * 手机号登录获取token
 *
 * @author Dave Syer
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component(MobileTokenMemberGranter.GRANT_TYPE)
@RequiredArgsConstructor
public class MobileTokenMemberGranter extends AbstractTokenMemberGranter implements TokenMemberGranter {

    public static final String GRANT_TYPE = "MOBILE";
    private final CaptchaService captchaService;
    private final MemberUserService memberUserService;

    @Override
    public R<LoginResultVO> checkParam(LoginParamVO loginParam) {
        String mobile = loginParam.getMobile();
        String code = loginParam.getCode();
        if (StrHelper.isAnyBlank(mobile, code)) {
            return R.fail("请输入手机号或验证码");
        }

        return R.success(null);
    }

    @Override
    protected R<LoginResultVO> checkCaptcha(LoginParamVO loginParam) {
        if (systemProperties.getVerifyCaptcha()) {
            R<Boolean> check = captchaService.checkCaptcha(loginParam.getMobile(), MsgTemplateCodeEnum.MOBILE_LOGIN.getCode(), loginParam.getCode());
            if (!check.getIsSuccess()) {
                String msg = check.getMsg();
                SpringUtils.publishEvent(new LoginEvent(LoginStatusDTO.smsCodeError(loginParam.getMobile(), LoginStatusEnum.SMS_CODE_ERROR, msg)));
                throw BizException.validFail(check.getMsg());
            }
        }
        return R.success(null);
    }

    @Override
    protected MemberUser getUser(LoginParamVO loginParam) {
        Boolean userByMobile = memberUserService.checkMobile(loginParam.getMobile(), null);
        if (!userByMobile) {
            MemberUser memberUser = MemberUser.builder().mobile(loginParam.getMobile()).password(systemProperties.getDefPwd()).build();
            memberUser.setCreatedBy(0L);
            memberUserService.register(memberUser);
        }
        return memberUserService.getUserByMobile(loginParam.getMobile());
    }

}
