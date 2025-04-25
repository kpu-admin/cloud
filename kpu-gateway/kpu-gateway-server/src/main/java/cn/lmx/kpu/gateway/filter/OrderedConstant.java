package cn.lmx.kpu.gateway.filter;

import org.springframework.core.Ordered;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface OrderedConstant {
    /**
     * 调用链
     */
    int TRACE = Ordered.HIGHEST_PRECEDENCE;
    /**
     * 解析token
     */
    int TOKEN = -1000;
    /**
     * uri权限
     */
    int AUTHENTICATION = -500;
    int SWAGGER = 1;
    int GRAY = 10150;
}
