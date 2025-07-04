package cn.lmx.kpu.satoken.config;

import cn.lmx.kpu.common.properties.SystemProperties;
import cn.lmx.kpu.satoken.interceptor.NotAllowWriteInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 永远执行的配置
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@RequiredArgsConstructor
public class AlwaysConfigurer implements WebMvcConfigurer {
    private final SystemProperties systemProperties;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new NotAllowWriteInterceptor(systemProperties))
                .addPathPatterns("/**")
                .order(Integer.MIN_VALUE);
    }
}
