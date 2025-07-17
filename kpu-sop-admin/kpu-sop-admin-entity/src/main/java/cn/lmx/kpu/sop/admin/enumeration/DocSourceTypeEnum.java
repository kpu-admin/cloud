package cn.lmx.kpu.sop.admin.enumeration;

import cn.lmx.basic.interfaces.BaseEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.stream.Stream;

/**
 * 来源类型,1-torna,2-自建
 *
 * @author 六如
 */
@Getter
@AllArgsConstructor
@Schema(description = "来源类型-枚举")
public enum DocSourceTypeEnum implements BaseEnum {
    TORNA("01", "Torna"),
    CUSTOM("02", "自建");

    final String code;
    final String desc;
    /**
     * 根据当前枚举的name匹配
     */
    public static DocSourceTypeEnum match(String val, DocSourceTypeEnum def) {
        return Stream.of(values()).parallel().filter(item -> item.name().equalsIgnoreCase(val)).findAny().orElse(def);
    }

    public static DocSourceTypeEnum get(String val) {
        return match(val, null);
    }

    public boolean eq(DocSourceTypeEnum val) {
        return val != null && eq(val.name());
    }

    @Override
    @Schema(description = "name", allowableValues = "01,02", example = "01")
    public String getCode() {
        return this.code;
    }

    @Override
    @Schema(description = "数据库中存储的值")
    public String getValue() {
        return this.code;
    }
}
