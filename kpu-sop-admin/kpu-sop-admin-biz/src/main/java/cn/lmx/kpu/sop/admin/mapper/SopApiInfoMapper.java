package cn.lmx.kpu.sop.admin.mapper;

import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.admin.entity.SopApiInfo;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * Mapper 接口
 * 接口信息表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 * @create [2025-07-06 19:04:42] [lmx] [代码生成器生成]
 */
@Repository
public interface SopApiInfoMapper extends SuperMapper<SopApiInfo> {

    default SopApiInfo getByNameVersion(String apiName, String apiVersion) {
         return this.selectOne(Wraps.<SopApiInfo>lbQ()
                .eq(SopApiInfo::getApiName, apiName)
                .eq(SopApiInfo::getApiVersion, apiVersion)
                 .last("limit 1")
         );

    }
}


