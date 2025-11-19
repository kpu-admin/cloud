import cn.hutool.core.date.LocalDateTimeUtil;
import cn.lmx.basic.utils.TimeZoneUtil;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.TimeZone;

import static cn.lmx.basic.utils.DateUtils.DEFAULT_DATE_TIME_FORMAT;
import static cn.lmx.basic.utils.DateUtils.DEFAULT_TIME_FORMAT;

public class TimeZoneExample {

    public static void main(String[] args) {
        // 方式1：通过 java.time.ZoneId（Java 8+ 推荐）
        ZoneId defaultZoneId = ZoneId.systemDefault();
        System.out.println("当前默认时区（ZoneId）：" + defaultZoneId); // 例如：Asia/Shanghai

        // 方式2：通过 java.util.TimeZone（旧API）
        TimeZone defaultTimeZone = TimeZone.getDefault();
        System.out.println("当前默认时区（TimeZone）：" + defaultTimeZone.getID()); // 例如：Asia/Shanghai
        System.out.println("时区偏移量（毫秒）：" + defaultTimeZone.getRawOffset()); // 相对于UTC的毫秒偏移
        DateData data = new DateData();
        data.setDate(LocalDateTime.now());
//        // 默认（系统时区）
//        System.out.println("系统默认时区: " + TimeZoneContext.getZoneId());
//        System.out.println("默认输出 => " + JsonUtil.toJson(data));
//
//        // 改为东京
//        TimeZoneContext.setZoneId(ZoneId.of("Asia/Tokyo"));
//        System.out.println("切换到东京时区: " + TimeZoneContext.getZoneId());
//        System.out.println("东京输出 => " + JsonUtil.toJson(data));
//
//        // 改为纽约
//        TimeZoneContext.setZoneId(ZoneId.of("America/New_York"));
//        System.out.println("切换到纽约时区: " + TimeZoneContext.getZoneId());
//        System.out.println("纽约输出 => " + JsonUtil.toJson(data));
//        String json = JsonUtil.toJson(data);
//        //
//        DateData parse = JsonUtil.parse(json, DateData.class);
//        TimeZoneContext.setZoneId(ZoneId.systemDefault());
//        System.out.println("系统默认时区: " + TimeZoneContext.getZoneId());
//        System.out.println("默认输出 => " + JsonUtil.toJson(parse));
        ZoneId shanghai = ZoneId.of("Asia/Shanghai");
        ZoneId newYork = ZoneId.of("America/New_York");

        // === LocalDateTime 示例 ===
        LocalDateTime now = LocalDateTime.now(shanghai);
        System.out.println("上海时间 => " + now);
        System.out.println("纽约时间 => " + LocalDateTimeUtil.format(TimeZoneUtil.convert(now, shanghai, newYork), DEFAULT_DATE_TIME_FORMAT));

        // === LocalDate 示例 ===
        LocalDate today = LocalDate.now(shanghai);
        System.out.println("纽约对应日期 => " + LocalDateTimeUtil.format(TimeZoneUtil.convert(today, shanghai, newYork), DEFAULT_DATE_TIME_FORMAT));

        // === LocalTime 示例 ===
        LocalTime time = LocalTime.of(10, 30);
        System.out.println("上海时间(10:30) 对应纽约时间 => " + TimeZoneUtil.convert(time, shanghai, newYork, LocalDate.now()).format(DateTimeFormatter.ofPattern(DEFAULT_TIME_FORMAT)));

        // === Date 示例 ===
        Date date = new Date();
        System.out.println("Date 当前 => " + date);
        System.out.println("Date 转纽约 => " + TimeZoneUtil.convert(date, shanghai, newYork));

        // === LocalDateTime <-> Date ===
        Date d2 = TimeZoneUtil.toDate(now, shanghai);
        LocalDateTime ldt2 = TimeZoneUtil.toLocalDateTime(d2, newYork);
        System.out.println("LocalDateTime <-> Date 互转 => " + ldt2);
    }

}

@Data
class DateData {
    private LocalDateTime date;
}