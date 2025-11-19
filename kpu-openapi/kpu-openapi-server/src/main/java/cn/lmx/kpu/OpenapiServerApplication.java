package cn.lmx.kpu;

import cn.lmx.basic.validator.annotation.EnableFormValidator;
import cn.lmx.kpu.common.ServerApplication;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import java.net.UnknownHostException;

/**
 * 开放平台对外接口服务启动类
 *
 * @author lmx
 * @date 2025-07-07 09:43:01
 */
@SpringBootApplication
@EnableDiscoveryClient
@Configuration
@EnableFeignClients(value = {"cn.lmx.kpu", "cn.lmx.basic"})
@ComponentScan(basePackages = {"cn.lmx.kpu", "cn.lmx.basic"})
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@Slf4j
@EnableFormValidator
@EnableDubbo
public class OpenapiServerApplication extends ServerApplication {
    public static void main(String[] args) throws UnknownHostException {
        start(OpenapiServerApplication.class, args);
    }
}
