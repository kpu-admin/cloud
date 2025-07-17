package cn.lmx.kpu.sop.admin.constants;

import java.util.Objects;

/**
 * @author 六如
 */
public class YesOrNo {
    public static final int YES = 1;
    public static final int NO = 0;

    public static boolean yes(Number value) {
        return value != null && value.intValue() == YES;
    }

    public static int of(Boolean b) {
        return Objects.equals(b, true) ? YES : NO;
    }

}
