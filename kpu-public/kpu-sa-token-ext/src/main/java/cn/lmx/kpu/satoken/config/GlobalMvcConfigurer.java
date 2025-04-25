package cn.lmx.kpu.satoken.config;

import lombok.RequiredArgsConstructor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import cn.lmx.kpu.common.properties.SystemProperties;
import cn.lmx.kpu.satoken.interceptor.HeaderThreadLocalInterceptor;
import cn.lmx.kpu.satoken.interceptor.NotAllowWriteInterceptor;

/**
 * 公共配置类, 一些公共工具配置
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@RequiredArgsConstructor
public class GlobalMvcConfigurer implements WebMvcConfigurer {
    private final SystemProperties systemProperties;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new HeaderThreadLocalInterceptor())
                .addPathPatterns("/**")
                .order(-20);
        registry.addInterceptor(new NotAllowWriteInterceptor(systemProperties))
                .addPathPatterns("/**")
                .order(Integer.MIN_VALUE);
    }
}
