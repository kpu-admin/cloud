package cn.lmx.kpu.sop.admin.mapper;

import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.admin.entity.SopIsvInfo;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * Mapper 接口
 * isv信息表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Repository
public interface SopIsvInfoMapper extends SuperMapper<SopIsvInfo> {

    default SopIsvInfo getByAppId(String appId) {
        return this.selectOne(Wraps.<SopIsvInfo>lbQ().eq(SopIsvInfo::getAppId, appId).last("limit 1"));
    }
}


