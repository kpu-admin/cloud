package cn.lmx.kpu.msg.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.msg.entity.DefInterfaceProperty;

import java.util.Map;

/**
 * <p>
 * 通用业务接口
 * 接口属性
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface DefInterfacePropertyManager extends SuperManager<DefInterfaceProperty> {
    /**
     * 根据接口ID查询接口属性参数
     *
     * @param id
     * @return
     */
    Map<String, Object> listByInterfaceId(Long id);
}


