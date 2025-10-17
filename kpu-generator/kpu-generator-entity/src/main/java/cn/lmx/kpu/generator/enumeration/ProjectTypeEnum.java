package cn.lmx.kpu.generator.enumeration;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import cn.lmx.basic.interfaces.BaseEnum;

/**
 * 项目类型
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@Getter
@AllArgsConstructor
@Schema(title = "ProjectTypeEnum", description = "项目类型")
public enum ProjectTypeEnum implements BaseEnum {
    /**
     * 单体版
     */
    BOOT("单体版"),
    /**
     * 微服务版
     */
    CLOUD("微服务版");

    private final String desc;

    @Override
    public String getCode() {
        return this.name();
    }

    @Override
    public String getValue() {
        return this.name();
    }

    public boolean eq(ProjectTypeEnum val) {
        return val != null && this.getCode().equalsIgnoreCase(val.getCode());
    }
}
