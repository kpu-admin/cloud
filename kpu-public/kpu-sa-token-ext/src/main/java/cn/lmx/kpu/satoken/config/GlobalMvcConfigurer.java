package cn.lmx.kpu.satoken.config;

import cn.lmx.kpu.satoken.interceptor.HeaderThreadLocalInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 *  单体模式不执行的类
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@RequiredArgsConstructor
public class GlobalMvcConfigurer implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new HeaderThreadLocalInterceptor())
                .addPathPatterns("/**")
                .order(-20);
    }
}
