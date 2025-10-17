package cn.lmx.kpu.shop.config;

 import cn.lmx.basic.boot.handler.AbstractGlobalExceptionHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.DispatcherServlet;

import jakarta.servlet.Servlet;

/**
 * 商城-全局异常处理
 *
 * @author lmx
 * @date 2025-08-18 06:29:35
 */
@Configuration
@ConditionalOnClass({Servlet.class, DispatcherServlet.class})
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
@RestControllerAdvice(annotations = {RestController.class, Controller.class})
@Slf4j
public class ShopExceptionConfiguration extends AbstractGlobalExceptionHandler {
}
