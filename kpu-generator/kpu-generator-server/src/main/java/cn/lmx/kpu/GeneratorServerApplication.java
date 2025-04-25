package cn.lmx.kpu;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import cn.lmx.basic.validator.annotation.EnableFormValidator;
import cn.lmx.kpu.common.ServerApplication;

import java.net.UnknownHostException;

import static cn.lmx.kpu.common.constant.BizConstant.BUSINESS_PACKAGE;
import static cn.lmx.kpu.common.constant.BizConstant.UTIL_PACKAGE;

/**
 * 在线代码生成器模块启动类
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@SpringBootApplication
@EnableDiscoveryClient
@Configuration
@EnableFeignClients(value = {BUSINESS_PACKAGE, UTIL_PACKAGE})
@ComponentScan(basePackages = {BUSINESS_PACKAGE, UTIL_PACKAGE})
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@Slf4j

@EnableFormValidator
public class GeneratorServerApplication extends ServerApplication {
    public static void main(String[] args) throws UnknownHostException {
        start(GeneratorServerApplication.class, args);
    }
}
