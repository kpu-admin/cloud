package cn.lmx.kpu.generator.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.DispatcherServlet;
import cn.lmx.basic.boot.handler.AbstractGlobalExceptionHandler;

import jakarta.servlet.Servlet;

/**
 * 在线代码生成器模块-全局异常处理
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Configuration
@ConditionalOnClass({Servlet.class, DispatcherServlet.class})
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
@RestControllerAdvice(annotations = {RestController.class, Controller.class})
@Slf4j
public class GeneratorExceptionConfiguration extends AbstractGlobalExceptionHandler {
}
