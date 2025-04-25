package cn.lmx.kpu.system.mapper.application;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.system.entity.application.DefApplication;
import cn.lmx.kpu.system.vo.result.application.DefApplicationResultVO;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * 应用
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface DefApplicationMapper extends SuperMapper<DefApplication> {

    /**
     * 查询我的应用
     *
     * @param name 应用名
     * @return
     */
    List<DefApplicationResultVO> findMyApplication(@Param("name") String name);

}
