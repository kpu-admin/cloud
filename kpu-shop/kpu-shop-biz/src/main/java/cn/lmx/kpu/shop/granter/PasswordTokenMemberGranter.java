package cn.lmx.kpu.shop.granter;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import cn.lmx.basic.base.R;
import cn.lmx.basic.exception.code.ExceptionCode;
import cn.lmx.basic.utils.DateUtils;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.basic.utils.StrHelper;
import cn.lmx.basic.utils.ValidatorUtil;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.shop.event.LoginEvent;
import cn.lmx.kpu.shop.event.model.LoginStatusDTO;
import cn.lmx.kpu.shop.vo.param.LoginParamVO;
import cn.lmx.kpu.shop.vo.result.oauth.LoginResultVO;
import cn.lmx.kpu.system.enumeration.system.LoginStatusEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 账号密码登录获取token
 *
 * @author Dave Syer
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component(PasswordTokenMemberGranter.GRANT_TYPE)
@Slf4j
public class PasswordTokenMemberGranter extends AbstractTokenMemberGranter implements TokenMemberGranter {

    public static final String GRANT_TYPE = "PASSWORD";

    @Override
    public R<LoginResultVO> checkParam(LoginParamVO loginParam) {
        String username = loginParam.getUsername();
        String password = loginParam.getPassword();
        if (StrHelper.isAnyBlank(username, password)) {
            return R.fail("请输入用户名或密码");
        }
        return R.success(null);
    }

    @Override
    protected MemberUser getUser(LoginParamVO loginParam) {
        String username = loginParam.getUsername();
//        boolean idCardLogin = ValidatorUtil.isIdCard(username);
//        if (idCardLogin) {
//            return memberUserService.getUserByIdCard(username);
//        }
        boolean mobileLogin = ValidatorUtil.isMobile(username);
        if (mobileLogin) {
            return memberUserService.getUserByMobile(username);
        }
        return memberUserService.getUserByUsername(username);
    }

    /**
     * 检测用户密码是否正确
     *
     * @param user       用户信息
     * @param loginParam 登录参数
     * @return 用户信息
     */
    @Override
    protected R<LoginResultVO> checkUserPassword(LoginParamVO loginParam, MemberUser user) {
        String username = loginParam.getUsername();
        String password = loginParam.getPassword();
        // 密码错误
        if (user == null) {
            SpringUtils.publishEvent(new LoginEvent(LoginStatusDTO.fail(username, LoginStatusEnum.USER_ERROR, "用户不存在！")));
            return R.fail(ExceptionCode.JWT_USER_INVALID);
        }

        // 方便开发、测试、演示环境 开发者登录别人的账号，生产环境禁用。
        if (!systemProperties.getVerifyPassword()) {
            return R.success(null);
        }

        // 用户锁定
        Integer passwordErrorNum = Convert.toInt(user.getPasswordErrorNum(), 0);
        Integer maxPasswordErrorNum = systemProperties.getMaxPasswordErrorNum();
        if (maxPasswordErrorNum > 0 && passwordErrorNum >= maxPasswordErrorNum) {
            log.info("[{}][{}], 输错密码次数：{}, 最大限制次数:{}", user.getNickName(), user.getId(), passwordErrorNum, maxPasswordErrorNum);

            /*
             * (最后一次输错密码的时间 + 锁定时间) 与 (当前时间) 比较
             * (最后一次输错密码的时间 + 锁定时间) > (当前时间) 表示未解锁
             * (最后一次输错密码的时间 + 锁定时间) < (当前时间) 表示自动解锁，并重置错误次数和最后一次错误时间
             */
            LocalDateTime passwordErrorLockExpireTime = DateUtils.conversionDateTime(user.getPasswordErrorLastTime(), systemProperties.getPasswordErrorLockUserTime());
            log.info("密码最后一次输错后，解锁时间: {}", passwordErrorLockExpireTime);
            // passwordErrorLockTime(锁定到期时间) > 当前时间
            if (passwordErrorLockExpireTime.isAfter(LocalDateTime.now())) {
                // 登录失败事件
                String msg = StrUtil.format("密码连续输错次数已超过最大限制：{}次,用户将被锁定至: {}", maxPasswordErrorNum, DateUtils.format(passwordErrorLockExpireTime));
                SpringUtils.publishEvent(new LoginEvent(LoginStatusDTO.fail(user.getId(), LoginStatusEnum.USER_ERROR, msg)));
                return R.fail(msg);
            }
        }

        String passwordMd5 = SecureUtil.sha256(password + user.getSalt());
        if (!passwordMd5.equalsIgnoreCase(user.getPassword())) {
            String msg = StrUtil.format("用户名或密码错误{}次，连续输错{}次您将被锁定！", (user.getPasswordErrorNum() + 1), maxPasswordErrorNum);
            // 密码错误事件
            SpringUtils.publishEvent(new LoginEvent(LoginStatusDTO.fail(user.getId(), LoginStatusEnum.PASSWORD_ERROR, msg)));
            return R.fail(msg);
        }
        return R.success(null);
    }

}
