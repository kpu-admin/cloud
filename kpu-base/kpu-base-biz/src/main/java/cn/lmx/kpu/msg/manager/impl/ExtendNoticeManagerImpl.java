package cn.lmx.kpu.msg.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.msg.entity.ExtendNotice;
import cn.lmx.kpu.msg.manager.ExtendNoticeManager;
import cn.lmx.kpu.msg.mapper.ExtendNoticeMapper;

/**
 * <p>
 * 通用业务实现类
 * 通知表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class ExtendNoticeManagerImpl extends SuperManagerImpl<ExtendNoticeMapper, ExtendNotice> implements ExtendNoticeManager {

}


