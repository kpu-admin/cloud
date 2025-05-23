package cn.lmx.kpu.msg.glue.impl;

import jakarta.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.annotation.AnnotationUtils;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.msg.glue.GlueFactory;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/**
 * @author xuxueli 2025-01-01 00:00
 */
public class SpringGlueFactory extends GlueFactory {
    private static final Logger logger = LoggerFactory.getLogger(SpringGlueFactory.class);


    /**
     * inject action of spring
     *
     * @param instance
     */
    @Override
    public void injectService(Object instance) {
        if (instance == null) {
            return;
        }

        if (SpringUtils.getApplicationContext() == null) {
            return;
        }

        Field[] fields = instance.getClass().getDeclaredFields();
        for (Field field : fields) {
            if (Modifier.isStatic(field.getModifiers())) {
                continue;
            }

            Object fieldBean = null;
            // with bean-id, bean could be found by both @Resource and @Autowired, or bean could only be found by @Autowired

            if (AnnotationUtils.getAnnotation(field, Resource.class) != null) {
                try {
                    Resource resource = AnnotationUtils.getAnnotation(field, Resource.class);
                    if (resource != null && resource.name() != null && resource.name().length() > 0) {
                        fieldBean = SpringUtils.getBean(resource.name());
                    } else {
                        fieldBean = SpringUtils.getBean(field.getName());
                    }
                } catch (Exception e) {
                }
                if (fieldBean == null) {
                    fieldBean = SpringUtils.getBean(field.getType());
                }
            } else if (AnnotationUtils.getAnnotation(field, Autowired.class) != null) {
                Qualifier qualifier = AnnotationUtils.getAnnotation(field, Qualifier.class);
                if (qualifier != null && qualifier.value() != null && qualifier.value().length() > 0) {
                    fieldBean = SpringUtils.getBean(qualifier.value());
                } else {
                    fieldBean = SpringUtils.getBean(field.getType());
                }
            }

            if (fieldBean != null) {
                field.setAccessible(true);
                try {
                    field.set(instance, fieldBean);
                } catch (IllegalArgumentException | IllegalAccessException e) {
                    logger.error(e.getMessage(), e);
                }
            }
        }
    }

}
