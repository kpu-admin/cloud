package cn.lmx.kpu.gateway.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @author lmx
 */
public class DateUtil {


    public static LocalDateTime parseToLocalDateTime(String date, DateTimeFormatter dateTimeFormatter) {
        return LocalDateTime.parse(date, dateTimeFormatter);
    }

}
