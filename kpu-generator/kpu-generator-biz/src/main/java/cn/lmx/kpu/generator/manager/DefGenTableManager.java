package cn.lmx.kpu.generator.manager;

import com.baomidou.mybatisplus.annotation.DbType;
import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.generator.entity.DefGenTable;

import javax.sql.DataSource;

/**
 * <p>
 * 通用业务接口
 * 代码生成
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DefGenTableManager extends SuperManager<DefGenTable> {
    /**
     * 获取数据源
     *
     * @param dsId dsId
     * @return javax.sql.DataSource
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     * @update [2025-01-01 00:00 ] [lmx] [变更描述]
     */
    DataSource getDs(Long dsId);

    /**
     * 获取数据库类型
     *
     * @return com.baomidou.mybatisplus.annotation.DbType
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    DbType getDbType();
}
