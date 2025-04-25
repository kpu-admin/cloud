package cn.lmx.kpu.system.facade;

import cn.lmx.basic.base.R;
import cn.lmx.basic.interfaces.echo.LoadService;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 用户
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DefUserFacade extends LoadService {
    /**
     * 查询所有的用户id
     *
     * @return 用户id
     */

    R<List<Long>> findAllUserId();

    /**
     * 根据id查询实体
     *
     * @param ids 唯一键（可能不是主键ID)
     * @return
     */
    @Override
    Map<Serializable, Object> findByIds(Set<Serializable> ids);


}
