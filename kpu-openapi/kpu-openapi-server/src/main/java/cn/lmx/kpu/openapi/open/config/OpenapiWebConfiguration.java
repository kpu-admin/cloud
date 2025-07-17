package cn.lmx.kpu.openapi.open.config;

import cn.lmx.basic.boot.config.BaseConfig;
import cn.lmx.basic.log.event.SysLogListener;
import cn.lmx.kpu.oauth.facade.LogFacade;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 开放平台对外接口服务-Web配置
 *
 * @author lmx
 * @date 2025-07-07 09:43:01
 */
@Configuration
public class OpenapiWebConfiguration extends BaseConfig {

    /**
     * kpu.log.enabled = true 并且 kpu.log.type=DB时实例该类
     */
    @Bean
    @ConditionalOnExpression("${kpu.log.enabled:true} && 'DB'.equals('${kpu.log.type:LOGGER}')")
    public SysLogListener getSysLogListener(LogFacade logApi) {
        return new SysLogListener(logApi::save);
    }
}
