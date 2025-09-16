package cn.lmx.kpu.shop.granter;


import cn.lmx.basic.base.R;
import cn.lmx.kpu.shop.vo.param.LoginParamVO;
import cn.lmx.kpu.shop.vo.result.oauth.LoginResultVO;

/**
 * 授予token接口
 *
 * @author Dave Syer
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface TokenMemberGranter {

    /**
     * 获取用户信息
     *
     * @param loginParam 授权参数
     * @return LoginDTO
     */
    R<LoginResultVO> login(LoginParamVO loginParam);

    /**
     * 退出
     *
     * @return
     */
    R<Boolean> logout();

}
