package cn.lmx.kpu.shop.controller.oauth;


import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import cn.lmx.basic.base.R;
import cn.lmx.basic.exception.BizException;
import cn.lmx.kpu.shop.granter.RefreshTokenMemberGranter;
import cn.lmx.kpu.shop.granter.TokenMemberGranterBuilder;
import cn.lmx.kpu.shop.service.user.MemberUserService;
import cn.lmx.kpu.shop.vo.param.LoginParamVO;
import cn.lmx.kpu.shop.vo.result.oauth.LoginResultVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 登录页 Controller
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@RestController
@RequestMapping
@AllArgsConstructor
@Tag(name = "登录-退出-注册")
public class RootMemberController {

    private final TokenMemberGranterBuilder tokenMemberGranterBuilder;
    private final RefreshTokenMemberGranter refreshTokenMemberGranter;
    private final MemberUserService memberUserService;

    /**
     * 登录接口
     * grantType 表示登录类型 可选值为：CAPTCHA,REFRESH_TOKEN,PASSWORD,MOBILE
     * <p>
     * CAPTCHA： 用户名 + 密码 + 图片验证码登录
     * key：验证码唯一字符窜
     * code：图片验证码
     * username：用户名
     * password：密码
     * <p>
     * PASSWORD：用户名 + 密码 登录
     * username：用户名
     * password：密码
     * <p>
     * MOBILE：手机号 + 短信验证码登录
     * username：手机号
     * code：短信验证码
     * <p>
     * REFRESH_TOKEN：刷新token （未实现）
     *
     * @param login login
     * @return cn.lmx.basic.base.basic.R<result.vo.oauth.cn.lmx.kpu.LoginResultVO>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    @Operation(summary = "登录接口", description = "登录或者清空缓存时调用")
    @PostMapping(value = "/anyTenant/login")
    public R<LoginResultVO> login(@Validated @RequestBody LoginParamVO login) throws BizException {
        return tokenMemberGranterBuilder.getGranter(login.getGrantType()).login(login);
    }

    @Operation(summary = "刷新token[前端 vben5版本 有效]", description = "token过期时，刷新token使用")
    @PostMapping(value = "/anyTenant/refresh")
    public R<LoginResultVO> refresh(@RequestParam String refreshToken) throws BizException {
        return R.success(refreshTokenMemberGranter.refresh(refreshToken));
    }

    @Operation(summary = "退出", description = "退出")
    @PostMapping(value = "/anyUser/logout")
    public R<Boolean> logout() {
        return tokenMemberGranterBuilder.getGranter().logout();
    }


    /**
     * 验证token
     */
    @Operation(summary = "验证token是否正确", description = "验证token")
    @GetMapping(value = "/anyTenant/verify")
    public R<SaSession> verify(@RequestParam(value = "token") String token) throws BizException {
        return R.success(StpUtil.getTokenSessionByToken(token));
    }


    @Operation(summary = "检测手机号是否存在")
    @GetMapping("/anyTenant/checkMobile")
    public R<Boolean> checkMobile(@RequestParam String mobile) {
        return R.success(memberUserService.checkMobile(mobile, null));
    }


}
