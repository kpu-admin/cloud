package cn.lmx.kpu.sop.admin.manager.impl;

import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.sop.admin.manager.SopSysConfigManager;
import cn.lmx.kpu.sop.admin.entity.SopSysConfig;
import cn.lmx.kpu.sop.admin.mapper.SopSysConfigMapper;

/**
 * <p>
 * 通用业务实现类
 * 系统配置表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopSysConfigManagerImpl extends SuperManagerImpl<SopSysConfigMapper, SopSysConfig> implements SopSysConfigManager {

//    @Override
//    protected CacheKeyBuilder cacheKeyBuilder() {
//        // TODO 需要自行新建一个 CacheKeyBuilder
//        return null;
//    }

    @Override
    public String getValueByKey(String key) {
        return getOne(Wraps.<SopSysConfig>lbQ().eq(SopSysConfig::getConfigKey, key).last("limit 1")).getConfigValue();
    }
}


