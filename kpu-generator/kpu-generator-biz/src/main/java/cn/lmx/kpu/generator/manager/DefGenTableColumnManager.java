package cn.lmx.kpu.generator.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.generator.entity.DefGenTableColumn;

import java.util.Collection;

/**
 * <p>
 * 通用业务接口
 * 代码生成字段
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DefGenTableColumnManager extends SuperManager<DefGenTableColumn> {
    /**
     * 根据 生成表ID 删除字段
     *
     * @param idList idList
     * @return boolean
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    boolean removeByTableIds(Collection<Long> idList);
}
