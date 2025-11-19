package cn.lmx.kpu.oauth.enumeration;

import cn.hutool.core.convert.Convert;
import cn.lmx.basic.interfaces.BaseEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.stream.Stream;

/**
 * 登录系统，还有一种是系统超级管理员
 *
 * @author 乾乾
 * @date 2025/06/09 11:26 上午
 */
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "登录系统类型-枚举")
public enum LoginEnum implements BaseEnum {
    MANAGER(1, "管理端登录: admin|RAM"),
    IM(2, "IM系统登录"),
    ;
    private Integer value;
    @Schema(description = "描述")
    private String desc;


    /**
     * 根据当前枚举的name匹配
     */
    public static LoginEnum match(String val, LoginEnum def) {
        return Stream.of(values()).parallel().filter(item -> item.name().equalsIgnoreCase(val)).findAny().orElse(def);
    }

    public static LoginEnum get(String val) {
        return match(val, null);
    }

    public boolean eq(LoginEnum val) {
        return val != null && eq(val.name());
    }

    @Override
    @Schema(description = "编码", allowableValues = "MANAGER,IM", example = "MANAGER")
    public String getCode() {
        return Convert.toStr(this.value);
    }
}
