package cn.lmx.kpu.generator.config;

import lombok.Data;
import lombok.NoArgsConstructor;
import cn.lmx.kpu.generator.enumeration.SuperClassEnum;

import java.util.HashSet;
import java.util.Set;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
public class ServiceConfig {

    /**
     * 自定义继承的Service类全称，带包名
     */
    private String superServiceClass = SuperClassEnum.SUPER_CLASS.getService();

    /**
     * 自定义继承的ServiceImpl类全称，带包名
     */
    private String superServiceImplClass = SuperClassEnum.SUPER_CLASS.getServiceImpl();
    /**
     * 格式化service接口文件名称
     */
    private String formatServiceFileName = "{}Service";
    /**
     * 格式化service实现类文件名称
     */
    private String formatServiceImplFileName;

    /**
     * serviceImpl 类上是否添加切换数据源注解 @DS
     */
    private Set<String> dsTablePrefix = new HashSet();

}
