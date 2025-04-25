package cn.lmx.kpu.satoken.config;

import cn.dev33.satoken.context.SaTokenContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.common.properties.IgnoreProperties;
import cn.lmx.kpu.common.properties.SystemProperties;

/**
 * 注册 Sa-Token 框架所需要的 Bean
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Slf4j
public class MySaTokenContextRegister {

    @Configuration
    @ConditionalOnProperty(prefix = Constants.PROJECT_PREFIX + ".webmvc", name = "header", havingValue = "true", matchIfMissing = true)
    public static class InnerConfig {
        public InnerConfig() {
            log.info("加载：{}", InnerConfig.class.getName());
        }

        @Bean
        @ConditionalOnClass
        public GlobalMvcConfigurer getGlobalMvcConfigurer(SystemProperties systemProperties, IgnoreProperties ignoreProperties) {
            return new GlobalMvcConfigurer(systemProperties);
        }

    }

}
