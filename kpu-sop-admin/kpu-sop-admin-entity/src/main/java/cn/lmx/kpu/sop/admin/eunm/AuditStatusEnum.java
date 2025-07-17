package cn.lmx.kpu.sop.admin.eunm;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import cn.lmx.basic.interfaces.BaseEnum;

import java.util.stream.Stream;

/**
 * web pro 前端组件
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "审核状态-枚举")
public enum AuditStatusEnum implements BaseEnum {
    /**
     * 初始化
     */
    INIT("初始化","0","default"),
    /**
     * 申请中
     */
    APPLYING("申请中","1","default"),
    /**
     * 通过
     */
    PASS("通过","2","success"),
    //    退回
    BACK("退回","99","error");
    private String desc;
    private String value;
    @Schema(description = "扩展")
    private String extra;



    /**
     * 根据当前枚举的name匹配
     */
    public static AuditStatusEnum match(String val, AuditStatusEnum def) {
        return Stream.of(values()).parallel().filter(item -> item.name().equalsIgnoreCase(val)).findAny().orElse(def);
    }

    public static AuditStatusEnum get(String val) {
        return match(val, null);
    }

    public boolean eq(AuditStatusEnum val) {
        return val != null && eq(val.name());
    }

    @Override
    @Schema(description = "编码", example = "01")
    public String getCode() {
        return this.value;
    }


}

