package cn.lmx.kpu.system.enumeration.tenant;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import cn.lmx.basic.interfaces.BaseEnum;

/**
 * 资源 打开方式
 * [01-组件 02-内链 03-外链]
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "资源类型-打开方式")
public enum ResourceOpenWithEnum implements BaseEnum {
    /**
     * 组件
     */
    INNER_COMPONENT("01", "菜单"),
    /**
     * 内链
     */
    INNER_CHAIN("02", "内链"),
    /**
     * 外链
     */
    OUTER_CHAIN("03", "外链");



    /**
     * 打开方式
     */
    private String code;

    /**
     * 描述
     */
    private String desc;

    @Override
    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
