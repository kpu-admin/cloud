package cn.lmx.kpu;


import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import cn.lmx.kpu.common.ServerApplication;

import java.net.UnknownHostException;

import static cn.lmx.kpu.common.constant.BizConstant.BUSINESS_PACKAGE;
import static cn.lmx.kpu.common.constant.BizConstant.UTIL_PACKAGE;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@SpringBootApplication(exclude = {
        DataSourceAutoConfiguration.class
})
@EnableDiscoveryClient
@ComponentScan({
        UTIL_PACKAGE, BUSINESS_PACKAGE
})
@EnableFeignClients(value = {
        UTIL_PACKAGE, BUSINESS_PACKAGE
})
@Slf4j
public class GatewayServerApplication extends ServerApplication {
    public static void main(String[] args) throws UnknownHostException {
        start(GatewayServerApplication.class, args);
    }

}
