package cn.lmx.kpu.msg.facade;


import cn.lmx.kpu.msg.vo.update.ExtendMsgSendVO;

/**
 * 消息接口
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface MsgFacade {

    /**
     * 根据模板发送消息
     *
     * @param data 发送内容
     * @return
     */
    Boolean sendByTemplate(ExtendMsgSendVO data);
}
