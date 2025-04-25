package cn.lmx.kpu.oauth.facade;

import cn.lmx.basic.interfaces.echo.LoadService;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;

/**
 * 数据字典回显
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DictFacade extends LoadService {

    /**
     * 根据id查询实体
     *
     * @param ids 唯一键（可能不是主键ID)
     * @return
     */
    @Override
    Map<Serializable, Object> findByIds(Set<Serializable> ids);

}
