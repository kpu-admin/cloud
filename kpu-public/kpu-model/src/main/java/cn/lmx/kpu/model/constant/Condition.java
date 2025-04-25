package cn.lmx.kpu.model.constant;

import com.baomidou.mybatisplus.annotation.SqlCondition;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public class Condition {

    /** MySQL、Oracle 数据库的 模糊查询 */
    public static final String LIKE = SqlCondition.LIKE;
//    /**  ORACLE 数据库的 模糊查询 */
//    public static final String LIKE = SqlCondition.ORACLE_LIKE;
}
