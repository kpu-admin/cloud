package cn.lmx.kpu.shop.granter;

import cn.lmx.basic.exception.BizException;
import cn.lmx.kpu.shop.enumeration.oauth.GrantType;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * TokenMemberGranterBuilder
 * 采用策略模式，根据不同的登录策略，实现登录
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
public class TokenMemberGranterBuilder {

    private final Map<String, TokenMemberGranter> granterPool = new ConcurrentHashMap<>();

    public TokenMemberGranterBuilder(Map<String, TokenMemberGranter> granterPool) {
        /*
         * 为何启动时，granterPool有中3个数据？
         *
         * spring 有3种注入方式：
         *   1. 字段注入 如：@Autowired、@Resource
         *   2. set 方法注入
         *   3. 构造器注入
         * 这里用了构造器注入
         *
         * 除了支持注入单个实现类，还支持注入List、Map、数组等。
         *
         * 还不懂？ 问度娘：spring 注入原理解析
         */
        this.granterPool.putAll(granterPool);
    }

    /**
     * 获取TokenMemberGranter
     *
     * @param grantType 授权类型
     * @return ITokenMemberGranter
     */
    public TokenMemberGranter getGranter(GrantType grantType) {
        if (grantType == null) {
            throw new BizException("请传递正确的 grantType 参数");
        }
        // 策略模式
        TokenMemberGranter tokenGranter = granterPool.get(grantType.name());
        if (tokenGranter == null) {
            throw new BizException("grantType 不支持，请传递正确的 grantType 参数");
        }
        return tokenGranter;
    }

    public TokenMemberGranter getGranter() {
        TokenMemberGranter tokenGranter = granterPool.get(GrantType.PASSWORD.name());
        if (tokenGranter == null) {
            throw new BizException("grantType 不支持，请传递正确的 grantType 参数");
        }
        return tokenGranter;
    }

}
