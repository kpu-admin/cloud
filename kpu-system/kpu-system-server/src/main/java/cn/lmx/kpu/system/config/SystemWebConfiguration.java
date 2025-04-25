package cn.lmx.kpu.system.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import cn.lmx.basic.boot.config.BaseConfig;
import cn.lmx.basic.log.event.SysLogListener;
import cn.lmx.kpu.oauth.facade.LogFacade;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Configuration
public class SystemWebConfiguration extends BaseConfig {

    /**
     * kpu.log.enabled = true 并且 kpu.log.type=DB时实例该类
     */
    @Bean
    @ConditionalOnExpression("${kpu.log.enabled:true} && 'DB'.equals('${kpu.log.type:LOGGER}')")
    public SysLogListener sysLogListener(LogFacade logApi) {
        return new SysLogListener(logApi::save);
    }
}
