package cn.lmx.kpu.msg.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.msg.entity.ExtendMsg;
import cn.lmx.kpu.msg.manager.ExtendMsgManager;
import cn.lmx.kpu.msg.mapper.ExtendMsgMapper;

/**
 * <p>
 * 通用业务实现类
 * 消息
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class ExtendMsgManagerImpl extends SuperManagerImpl<ExtendMsgMapper, ExtendMsg> implements ExtendMsgManager {

}


