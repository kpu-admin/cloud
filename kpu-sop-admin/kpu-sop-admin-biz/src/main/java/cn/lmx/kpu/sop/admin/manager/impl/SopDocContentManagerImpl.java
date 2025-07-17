package cn.lmx.kpu.sop.admin.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.sop.admin.manager.SopDocContentManager;
import cn.lmx.kpu.sop.admin.entity.SopDocContent;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.sop.admin.mapper.SopDocContentMapper;

/**
 * <p>
 * 通用业务实现类
 * 文档内容
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 * @create [2025-07-06 19:04:42] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopDocContentManagerImpl extends SuperManagerImpl<SopDocContentMapper, SopDocContent> implements SopDocContentManager {

//    @Override
//    protected CacheKeyBuilder cacheKeyBuilder() {
//        // TODO 需要自行新建一个 CacheKeyBuilder
//        return null;
//    }
}


