package cn.lmx.kpu.base.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.annotation.database.TenantLine;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.base.entity.user.BaseEmployee;


/**
 * 仅仅测试使用
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@TenantLine
public interface BaseEmployeeTestMapper extends SuperMapper<BaseEmployee> {
    /**
     * get
     *
     * @param id id
     * @return cn.lmx.kpu.user.entity.base.kpu.BaseEmployee
     * @author lmx
     * @date 2025-01-01 00:00
     */
    @TenantLine(false)
    @Select("select * from base_employee where id = #{id}")
    BaseEmployee get(Long id);

}
