package cn.lmx.kpu.satoken.config;

import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.common.properties.IgnoreProperties;
import cn.lmx.kpu.common.properties.SystemProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 注册 Sa-Token 框架所需要的 Bean
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Slf4j
@RequiredArgsConstructor
public class MySaTokenContextRegister {

    @Bean
    public AlwaysConfigurer getAlwaysConfigurer(SystemProperties systemProperties) {
        return new AlwaysConfigurer(systemProperties);
    }


    @Configuration
    @ConditionalOnProperty(prefix = Constants.PROJECT_PREFIX + ".webmvc", name = "header", havingValue = "true", matchIfMissing = true)
    public static class InnerConfig {
        public InnerConfig() {
            log.info("加载：{}", InnerConfig.class.getName());
        }

        @Bean
        public GlobalMvcConfigurer getGlobalMvcConfigurer(IgnoreProperties ignoreProperties) {
            return new GlobalMvcConfigurer();
        }

    }

}
