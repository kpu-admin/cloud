package cn.lmx.kpu.oauth.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import cn.lmx.basic.boot.config.BaseConfig;
import cn.lmx.basic.log.event.SysLogListener;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.base.service.system.BaseOperationLogService;
import cn.lmx.kpu.base.vo.save.system.BaseOperationLogSaveVO;
import cn.lmx.kpu.common.properties.SystemProperties;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Configuration
@EnableConfigurationProperties(SystemProperties.class)
public class OauthWebConfiguration extends BaseConfig {

    /**
     * kpu.log.enabled = true 并且 kpu.log.type=DB时实例该类
     */
    @Bean
    @ConditionalOnExpression("${kpu.log.enabled:true} && 'DB'.equals('${kpu.log.type:LOGGER}')")
    public SysLogListener sysLogListener(BaseOperationLogService logApi) {
        return new SysLogListener(data -> logApi.save(BeanPlusUtil.toBean(data, BaseOperationLogSaveVO.class)));
    }
}
