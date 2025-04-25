package cn.lmx.kpu.system.mapper.application;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.system.entity.application.DefResource;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * 资源
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface DefResourceMapper extends SuperMapper<DefResource> {
    /**
     * 删除 角色-资源关系表
     *
     * @param resourceIds 资源id
     * @return int
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    int deleteRoleResourceRelByResourceId(@Param("resourceIds") List<Long> resourceIds);

    /**
     * 根据资源父ID和应用ID查询子资源最大排序值
     *
     * @param parentId 资源父ID
     * @return java.lang.Integer
     * @author lmx
     * @date 2025-02-17 01:13
     * @create [2025-02-17 01:13 ] [lmx ] [初始创建]
     **/
    Integer maxSortValueByParentIdAndApplicationId(@Param("parentId") Long parentId, @Param("applicationId") Long applicationId);
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
    Integer maxSortValueByTypeAndParentIdAndApplicationId(@Param("types")List<String> types,@Param("parentId")Long parentId, @Param("applicationId")Long applicationId);
}
