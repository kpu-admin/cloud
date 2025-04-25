package cn.lmx.kpu.generator.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.system.entity.tenant.DefDatasourceConfig;

/**
 * <p>
 * Mapper 接口
 * 数据源
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface GenDefDatasourceConfigMapper extends SuperMapper<DefDatasourceConfig> {

}
