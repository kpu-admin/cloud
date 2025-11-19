package cn.lmx.kpu.model.enumeration;

import cn.lmx.basic.interfaces.BaseEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "时区-枚举")
public enum TimezoneEnum implements BaseEnum {
    AmericaNewYork("America/New_York", -5),
    EuropeLondon("Europe/London", 0),
    AsiaShanghai("Asia/Shanghai", 8),
    AsiaTokyo("Asia/Tokyo", 9),
    AsiaSeoul("Asia/Seoul", 9);


    @Schema(description = "时区")
    private String timezone;

    @Schema(description = "时区偏移量")
    private int offset;

    @Override
    @Schema(description = "编码")
    public String getCode() {
        return timezone;
    }

    @Override
    @Schema(description = "描述")
    public String getDesc() {
        return timezone + " (GMT" + (offset > 0 ? "+" + offset : offset) + ")";
    }
}
