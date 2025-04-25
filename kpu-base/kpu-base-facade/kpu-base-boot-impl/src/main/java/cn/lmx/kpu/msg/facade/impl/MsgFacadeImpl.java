package cn.lmx.kpu.msg.facade.impl;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.msg.biz.MsgBiz;
import cn.lmx.kpu.msg.facade.MsgFacade;
import cn.lmx.kpu.msg.vo.update.ExtendMsgSendVO;

/**
 * 消息接口
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Service
@RequiredArgsConstructor
public class MsgFacadeImpl implements MsgFacade {
    private final MsgBiz msgBiz;

    /**
     * 根据模板发送消息
     *
     * @param data 发送内容
     * @return
     */
    @Override
    public Boolean sendByTemplate(ExtendMsgSendVO data) {
        return msgBiz.sendByTemplate(data, null);
    }
}
