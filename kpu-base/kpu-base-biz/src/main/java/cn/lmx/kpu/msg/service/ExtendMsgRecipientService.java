package cn.lmx.kpu.msg.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.msg.entity.ExtendMsgRecipient;

import java.util.List;


/**
 * <p>
 * 业务接口
 * 消息接收人
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface ExtendMsgRecipientService extends SuperService<Long, ExtendMsgRecipient> {
    /**
     * 根据消息ID查询接收人
     *
     * @param id
     * @return
     */
    List<ExtendMsgRecipient> listByMsgId(Long id);
}


