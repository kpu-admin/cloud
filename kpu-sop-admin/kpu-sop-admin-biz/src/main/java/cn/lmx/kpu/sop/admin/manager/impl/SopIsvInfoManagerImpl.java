package cn.lmx.kpu.sop.admin.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.sop.admin.manager.SopIsvInfoManager;
import cn.lmx.kpu.sop.admin.entity.SopIsvInfo;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.sop.admin.mapper.SopIsvInfoMapper;

/**
 * <p>
 * 通用业务实现类
 * isv信息表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopIsvInfoManagerImpl extends SuperManagerImpl<SopIsvInfoMapper, SopIsvInfo> implements SopIsvInfoManager {

//    @Override
//    protected CacheKeyBuilder cacheKeyBuilder() {
//        // TODO 需要自行新建一个 CacheKeyBuilder
//        return null;
//    }
}


