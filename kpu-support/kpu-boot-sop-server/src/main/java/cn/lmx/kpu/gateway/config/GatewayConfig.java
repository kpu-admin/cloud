package cn.lmx.kpu.gateway.config;

import cn.lmx.kpu.gateway.service.ParamExecutor;
import cn.lmx.kpu.gateway.service.Serde;
import cn.lmx.kpu.gateway.service.impl.ParamExecutorImpl;
import cn.lmx.kpu.gateway.service.impl.SerdeGsonImpl;
import cn.lmx.kpu.gateway.service.impl.SerdeImpl;
import com.gitee.sop.support.message.OpenMessageFactory;
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * @author 六如
 */
@Configuration
@Slf4j
public class GatewayConfig {

    private static final String REDIS = "redis";

    // 默认使用fastjson2序列化
    @Bean
    public Serde serdeFastjson2(@Value("${gateway.serialize.json-formatter:fastjson2}") String gatewaySerializeJsonFormatter) {
        log.info("[init]使用{}序列化", gatewaySerializeJsonFormatter);
        if ("gson".equalsIgnoreCase(gatewaySerializeJsonFormatter)) {
            return new SerdeGsonImpl();
        }
        return new SerdeImpl();
    }

    @Bean
    @ConditionalOnMissingBean
    public ParamExecutor paramExecutor() {
        return new ParamExecutorImpl();
    }

    @Bean
    @ConditionalOnMissingBean
    public Serde serde() {
        return new SerdeImpl();
    }

    @PostConstruct
    public void init() {
        OpenMessageFactory.initMessage();
    }
}
