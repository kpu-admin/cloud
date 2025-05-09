package com.xxl.job.executor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import cn.lmx.basic.validator.annotation.EnableFormValidator;

import static cn.lmx.kpu.common.constant.BizConstant.BUSINESS_PACKAGE;
import static cn.lmx.kpu.common.constant.BizConstant.UTIL_PACKAGE;

/**
 * @author xuxueli 2025-01-01 00:00
 */
@SpringBootApplication
@ComponentScan({
        UTIL_PACKAGE, BUSINESS_PACKAGE, "com.xxl.job.executor"
})
@EnableFormValidator
public class NoneExecutorServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(NoneExecutorServerApplication.class, args);
    }

}
