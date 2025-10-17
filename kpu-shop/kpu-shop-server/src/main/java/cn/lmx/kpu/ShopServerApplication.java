package cn.lmx.kpu;

import cn.lmx.basic.validator.annotation.EnableFormValidator;
import cn.lmx.kpu.common.ServerApplication;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.ComponentScan;

import java.net.UnknownHostException;

/**
 * 商城启动类
 *
 * @author lmx
 * @date 2025-08-18 06:29:35
 */
@SpringBootApplication
@EnableDiscoveryClient
@Configuration
@EnableFeignClients(value = {"cn.lmx.kpu", "cn.lmx.basic"})
@ComponentScan(basePackages = {"cn.lmx.kpu", "cn.lmx.basic"})
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@Slf4j
@EnableFormValidator
public class ShopServerApplication extends ServerApplication {
    public static void main(String[] args) throws UnknownHostException {
        start(ShopServerApplication.class, args);
    }
}
