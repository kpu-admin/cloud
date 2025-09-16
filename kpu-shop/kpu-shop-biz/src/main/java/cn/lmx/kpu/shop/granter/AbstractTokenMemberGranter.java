package cn.lmx.kpu.shop.granter;

import cn.dev33.satoken.config.SaTokenConfig;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.temp.SaTempUtil;
import cn.hutool.json.JSONObject;
import cn.lmx.basic.base.R;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.common.properties.SystemProperties;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.shop.event.LoginEvent;
import cn.lmx.kpu.shop.event.model.LoginStatusDTO;
import cn.lmx.kpu.shop.service.user.MemberUserService;
import cn.lmx.kpu.shop.vo.param.LoginParamVO;
import cn.lmx.kpu.shop.vo.result.oauth.LoginResultVO;
import cn.lmx.kpu.system.enumeration.system.LoginStatusEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import static cn.lmx.basic.context.ContextConstants.JWT_KEY_USER_ID;

/**
 * 验证码TokenMemberGranter
 *
 * @author lmx
 */
@Slf4j
public abstract class AbstractTokenMemberGranter implements TokenMemberGranter {

    @Autowired
    protected SystemProperties systemProperties;
    @Autowired
    protected MemberUserService memberUserService;
    @Autowired
    protected SaTokenConfig saTokenConfig;


    @Override
    public R<LoginResultVO> login(LoginParamVO loginParam) {
        // 0. 参数校验
        R<LoginResultVO> result = checkParam(loginParam);
        if (!result.getIsSuccess()) {
            return result;
        }

        // 1. 验证码
        result = checkCaptcha(loginParam);
        if (!result.getIsSuccess()) {
            return result;
        }

        // 2. 查找用户
        MemberUser memberUser = getUser(loginParam);

        // 3. 判断密码
        result = checkUserPassword(loginParam, memberUser);
        if (!result.getIsSuccess()) {
            return result;
        }

        // 4. 检查用户状态
        result = checkUserState(memberUser);
        if (!result.getIsSuccess()) {
            return result;
        }
        // 7. 封装token
        LoginResultVO loginResultVO = buildResult(memberUser);
        LoginStatusDTO loginStatus = LoginStatusDTO.success(memberUser.getId());
        SpringUtils.publishEvent(new LoginEvent(loginStatus));
        return R.success(loginResultVO);
    }

    /**
     * 检查参数
     *
     * @param loginParam 登录参数
     * @return cn.lmx.basic.base.basic.R<result.vo.oauth.cn.lmx.kpu.LoginResultVO>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    protected abstract R<LoginResultVO> checkParam(LoginParamVO loginParam);

    /**
     * 检查验证码
     *
     * @param loginParam 登录参数
     * @return cn.lmx.basic.base.basic.R<result.vo.oauth.cn.lmx.kpu.LoginResultVO>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    protected R<LoginResultVO> checkCaptcha(LoginParamVO loginParam) {
        return R.success(null);
    }

    /**
     * 查询用户
     *
     * @param loginParam 登录参数
     * @return tenant.entity.system.cn.lmx.kpu.MemberUser
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    protected abstract MemberUser getUser(LoginParamVO loginParam);

    /**
     * 检查用户账号密码是否正确
     *
     * @param loginParam loginParam
     * @param user       user
     * @return cn.lmx.basic.base.basic.R<result.vo.oauth.cn.lmx.kpu.LoginResultVO>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */

    protected R<LoginResultVO> checkUserPassword(LoginParamVO loginParam, MemberUser user) {
        return R.success(null);
    }

    /**
     * 检查用户状态是否正常
     *
     * @param user user
     * @return cn.lmx.basic.base.basic.R<result.vo.oauth.cn.lmx.kpu.LoginResultVO>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    protected R<LoginResultVO> checkUserState(MemberUser user) {
        // 用户被禁用
        if (!user.getState()) {
            String msg = "您已被禁用，请联系管理员开通账号！";
            SpringUtils.publishEvent(new LoginEvent(LoginStatusDTO.fail(user.getId(), LoginStatusEnum.USER_ERROR, msg)));
            return R.fail(msg);
        }
        return R.success(null);
    }

    /**
     * 构建返回值
     *
     * @param defUser  用户信息
     * @return result.vo.oauth.cn.lmx.kpu.LoginResultVO
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    protected LoginResultVO buildResult(MemberUser defUser) {
        //此登录接口登录web端
        StpUtil.login(defUser.getId(), "PC");
        SaSession tokenSession = StpUtil.getTokenSession();
        tokenSession.setLoginId(defUser.getId());

        LoginResultVO resultVO = new LoginResultVO();
        resultVO.setToken(StpUtil.getTokenValue());
        resultVO.setExpire(StpUtil.getTokenTimeout());
        // 获取到期时间戳
        long timestamp = System.currentTimeMillis() + resultVO.getExpire() * 1000L;
        resultVO.setExpiresTime(timestamp);
        JSONObject obj = new JSONObject();
        obj.set(JWT_KEY_USER_ID, defUser.getId());

        resultVO.setRefreshToken(SaTempUtil.createToken(obj.toString(), 2 * saTokenConfig.getTimeout()));


        log.info("用户：{}  {} 登录成功", defUser.getUsername(), defUser.getNickName());
        return resultVO;
    }

    @Override
    public R<Boolean> logout() {
        try {
            StpUtil.logout();
        } catch (Exception e) {
            log.debug("token已经过期，无需清理缓存");
        }
        return R.success(true);
    }

}
