package cn.lmx.kpu.system.enumeration.tenant;

import cn.lmx.basic.interfaces.BaseEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;

/**
 * 应用授权枚举
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Getter
@Schema(title = "ApplicationGrantTypeEnum", description = "应用授权枚举")
public enum ApplicationGrantTypeEnum implements BaseEnum {


    /**
     * 应用授权
     */
    GRANT("10", "应用授权"),

    /**
     * 应用续期
     */
    RENEWAL("20", "应用续期"),

    /**
     * 取消授权
     */
    CANCEL("30", "取消授权");

    /**
     * 资源类型
     */
    private final String code;
    private final String desc;

    ApplicationGrantTypeEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }
}
