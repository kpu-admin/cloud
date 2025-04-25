package cn.lmx.kpu.base.config;

import cn.lmx.kpu.oauth.facade.LogFacade;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import cn.lmx.basic.boot.config.BaseConfig;
import cn.lmx.basic.constant.Constants;
import cn.lmx.basic.log.event.SysLogListener;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.base.vo.save.system.BaseOperationLogSaveVO;

/**
 * 基础服务-Web配置
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Configuration
public class BaseWebConfiguration extends BaseConfig {

    /**
     * kpu.log.enabled = true 并且 kpu.log.type=DB时实例该类
     */
    @Bean
    @ConditionalOnExpression("${" + Constants.PROJECT_PREFIX + ".log.enabled:true} && 'DB'.equals('${" + Constants.PROJECT_PREFIX + ".log.type:LOGGER}')")
    public SysLogListener sysLogListener(LogFacade logApi) {
        return new SysLogListener(logApi::save);
    }
}
