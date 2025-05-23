package cn.lmx.kpu.system.manager.application;

import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.kpu.model.vo.result.ResourceApiVO;
import cn.lmx.kpu.system.entity.application.DefResourceApi;

import java.util.List;

/**
 * <p>
 * 通用业务层
 * 资源API
 * </p>
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public interface DefResourceApiManager extends SuperCacheManager<DefResourceApi> {
    /** 查询系统中配置的所有API与资源编码 */
    List<ResourceApiVO> findAllApi();

    /**
     * 根据资源id 删除资源的接口
     *
     * @param resourceIdList 资源id
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    void removeByResourceId(List<Long> resourceIdList);

    /**
     * 根据资源id查询资源接口
     *
     * @param resourceId 资源id
     * @return java.util.List<cn.lmx.kpu.tenant.vo.result.tenant.DefResourceApiResultVO>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    List<DefResourceApi> findByResourceId(Long resourceId);
}
