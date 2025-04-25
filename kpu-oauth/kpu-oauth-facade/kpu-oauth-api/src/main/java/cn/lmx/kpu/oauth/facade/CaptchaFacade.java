package cn.lmx.kpu.oauth.facade;

/**
 * 验证码
 * @author lmx
 * @version v1.0.0
 * @since 2025-01-01 00:00
 */
public interface CaptchaFacade {
    /***
     * 检查验证码是否正确
     * @param key 唯一键
     * @param code 验证码
     * @param templateCode 模版
     * @return
     */
    Boolean check(String key, String code, String templateCode);
}
