package cn.lmx.kpu.shop.controller.oauth;

import cn.hutool.core.bean.BeanUtil;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.exception.BizException;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.common.constant.AppendixType;
import cn.lmx.kpu.file.service.AppendixService;
import cn.lmx.kpu.model.vo.result.AppendixResultVO;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.shop.service.CaptchaService;
import cn.lmx.kpu.shop.service.user.MemberUserService;
import cn.lmx.kpu.shop.vo.result.oauth.MemberUserInfoResultVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserAvatarUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserBaseInfoUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserMobileUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserPasswordUpdateVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 认证Controller
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@RestController
@RequestMapping("/anyone")
@AllArgsConstructor
@Tag(name = "用户基本信息")
public class UserInfoController {

    private final MemberUserService memberUserService;
    private final CaptchaService captchaService;
    private final EchoService echoService;
    private final AppendixService appendixService;

    /**
     * 获取当前登录的用户信息
     */
    @Operation(summary = "获取当前登录的用户信息", description = "获取当前登录的用户信息：登录后，查询用户信息")
    @GetMapping(value = "/getUserInfoById")
    public R<MemberUserInfoResultVO> getUserInfoById(@RequestParam(required = false) Long userId) throws BizException {
        if (userId == null) {
            userId = ContextUtil.getUserId();
        }
        MemberUser memberUser = memberUserService.getById(userId);
        MemberUserInfoResultVO resultVO = BeanUtil.copyProperties(memberUser, MemberUserInfoResultVO.class);
        // 用户头像
        AppendixResultVO appendix = appendixService.getByBiz(memberUser.getId(), AppendixType.Shop.MEMBER__USER__AVATAR);
        if (appendix != null) {
            resultVO.setAvatarId(appendix.getId());
        }
        if (resultVO != null) {
            echoService.action(resultVO);
        }
        return R.success(resultVO);
    }

    /**
     * 修改头像
     *
     * @param data 用户头像信息
     * @return 用户
     */
    @Operation(summary = "修改头像", description = "修改头像")
    @PutMapping("/avatar")
    @WebLog("'修改头像:' + #data.id")
    public R<Boolean> avatar(@RequestBody @Validated DefUserAvatarUpdateVO data) {
        return R.success(memberUserService.updateAvatar(data));
    }

    /**
     * 修改密码
     *
     * @param data 修改实体
     * @return 是否成功
     */
    @Operation(summary = "修改密码", description = "修改密码")
    @PutMapping("/password")
    @WebLog("'修改密码:' + #data.id")
    public R<Boolean> updatePassword(@RequestBody @Validated DefUserPasswordUpdateVO data) {
        return R.success(memberUserService.updatePassword(data));
    }

    /**
     * 修改手机
     *
     * @param data 修改实体
     * @return 是否成功
     */
    @Operation(summary = "修改手机", description = "修改手机")
    @PutMapping("/mobile")
    @WebLog("'修改手机:' + #data.mobile")
    public R<Boolean> updateMobile(@RequestBody @Validated DefUserMobileUpdateVO data) {
        R<Boolean> r = captchaService.checkCaptcha(data.getMobile(), data.getTemplateCode(), data.getCode());
        if (!r.getIsSuccess()) {
            return r;
        }
        return R.success(memberUserService.updateMobile(data));
    }

    /**
     * 修改个人信息
     *
     * @param data 用户基础信息
     * @return 用户
     */
    @Operation(summary = "修改基础信息")
    @PutMapping("/baseInfo")
    @WebLog(value = "'修改基础信息:' + #data?.id", request = false)
    public R<Boolean> updateBaseInfo(@RequestBody @Validated DefUserBaseInfoUpdateVO data) {
        if (data.getId() == null) {
            data.setId(ContextUtil.getUserId());
        }
        return R.success(memberUserService.updateBaseInfo(data));
    }

}
