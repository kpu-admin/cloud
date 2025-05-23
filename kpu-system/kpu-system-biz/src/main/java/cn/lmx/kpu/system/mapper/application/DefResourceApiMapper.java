package cn.lmx.kpu.system.mapper.application;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.model.vo.result.ResourceApiVO;
import cn.lmx.kpu.system.entity.application.DefResourceApi;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * 资源接口
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface DefResourceApiMapper extends SuperMapper<DefResourceApi> {

    /** 查询系统中配置的所有API与资源编码 */
    @Select("""
            select ra.uri ,ra.request_method , r.code from def_resource_api ra inner join def_resource r on r.id = ra.resource_id 
            where r.state  = 1 order by r.sort_value asc
            """)
    List<ResourceApiVO> findAllApi();
}
