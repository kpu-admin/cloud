package cn.lmx.kpu.datascope.provider;

import cn.lmx.kpu.datascope.model.DataFieldProperty;

import java.util.List;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DataScopeProvider {
    /**
     * 查询数据字段
     *
     * @param fsp fsp
     * @return java.util.List<cn.lmx.kpu.datascope.model.DataFieldProperty>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    List<DataFieldProperty> findDataFieldProperty(List<DataFieldProperty> fsp);
}
