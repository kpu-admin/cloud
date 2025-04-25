package cn.lmx.kpu.system.mapper.system;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.system.entity.system.DefClient;

/**
 * <p>
 * Mapper 接口
 * 客户端
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface DefClientMapper extends SuperMapper<DefClient> {

}
