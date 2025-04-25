package cn.lmx.kpu.system.manager.system;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.basic.interfaces.echo.LoadService;
import cn.lmx.kpu.system.entity.system.DefDict;
import cn.lmx.kpu.system.vo.result.system.DefDictItemResultVO;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 字典管理
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public interface DefDictManager extends SuperManager<DefDict>, LoadService {

    /**
     * 根据字典key查询系统默认的字典条目
     *
     * @param dictKeys 字典key
     * @return key： 字典key  value: item list
     */
    Map<String, List<DefDictItemResultVO>> findDictMapItemListByKey(List<String> dictKeys);

    /**
     * 删除字典条目
     *
     * @param idList idList
     * @return boolean
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    boolean removeItemByIds(Collection<Long> idList);
}
