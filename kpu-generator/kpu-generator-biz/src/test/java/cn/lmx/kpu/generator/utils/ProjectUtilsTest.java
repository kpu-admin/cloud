package cn.lmx.kpu.generator.utils;

import cn.lmx.basic.database.properties.DatabaseProperties;
import cn.lmx.kpu.generator.enumeration.ProjectTypeEnum;
import cn.lmx.kpu.generator.vo.save.ProjectGeneratorVO;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public class ProjectUtilsTest {
    public static void main(String[] args) {
        ProjectGeneratorVO vo = new ProjectGeneratorVO();
        vo.setProjectPrefix("kpu");
        vo.setOutputDir("/Users/lmx/gitlab/kpu-cloud-pro-datasource-column");
        vo.setType(ProjectTypeEnum.CLOUD);
        vo.setAuthor("lmx");
        vo.setServiceName("test");
        vo.setModuleName("test");
        vo.setParent("cn.lmx.kpu");
        vo.setGroupId("cn.lmx.kpu");
        vo.setUtilParent("cn.lmx.basic");
        vo.setVersion("1.0.0");
        vo.setDescription("测试服务");
        vo.setServerPort(8080);
        ProjectUtils.generator(vo, new DatabaseProperties());
    }
}
