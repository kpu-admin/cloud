package cn.lmx.kpu.system.manager.application;

import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.kpu.system.entity.application.DefResource;
import jakarta.validation.constraints.NotNull;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * <p>
 * 通用业务层
 * 资源
 * </p>
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public interface DefResourceManager extends SuperCacheManager<DefResource> {
    /**
     * 查找特定应用，拥有的资源
     *
     * @param applicationIdList 应用ID
     * @param resourceTypes     资源类型
     * @return java.util.List<application.entity.system.cn.lmx.kpu.DefResource>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    List<DefResource> findResourceListByApplicationId(List<Long> applicationIdList, Collection<String> resourceTypes);

    /**
     * 根据资源ID和资源类型 查找资源
     *
     * @param idList 资源ID
     * @param types  资源类型
     * @return java.util.List<cn.lmx.kpu.system.entity.model.SysResource>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    List<DefResource> findByIdsAndType(Collection<? extends Serializable> idList, Collection<String> types);

    /**
     * 查询指定节点的下一级子节点
     * 不会递归查询
     *
     * @param parentId
     * @return
     */
    List<DefResource> findChildrenByParentId(Long parentId);

    /**
     * 查询指定节点的所有子节点
     * 递归查询
     *
     * @param parentId
     * @return
     */
    List<DefResource> findAllChildrenByParentId(Long parentId);
    /**
     * 删除 角色-资源关系表
     *
     * @param resourceIds 资源id
     * @return int
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    int deleteRoleResourceRelByResourceId(List<Long> resourceIds);
    /**
     * 根据应用id查询应用下的资源
     *
     * @param applicationIds applicationId
     * @return java.util.List<cn.lmx.kpu.tenant.entity.tenant.DefResource>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    List<DefResource> findByApplicationId(List<Long> applicationIds);
    /**
     * 根据资源父ID和应用ID查询子资源最大排序值
     * @param parentId 资源父ID
     * @return java.lang.Integer
     * @author lmx
     * @date 2025-02-17 01:12
     * @create [2025-02-17 01:12 ] [lmx ] [初始创建]
     **/
    Integer maxSortValueByParentIdAndApplicationId(Long parentId, Long applicationId);
    /**
     * 根据资源类型和资源父ID查询子资源最大排序值
     * @param types 资源类型
     * @param parentId 资源父ID
     * @param applicationId 应用ID
     * @return java.lang.Integer
     * @author lmx
     * @date 2025-03-01 08:30
     * @create [2025-03-01 08:30 ] [lmx ] [初始创建]
     **/
    Integer maxSortValueByTypeAndParentIdAndApplicationId(List<String> types,Long parentId, Long applicationId);
}
