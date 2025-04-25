package cn.lmx.kpu.msg.facade.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.msg.api.MsgApi;
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
public class MsgFacadeImpl implements MsgFacade {
    @Lazy
    @Autowired
    private MsgApi msgApi;

    /**
     * 根据模板发送消息
     *
     * @param data 发送内容
     * @return
     */
    @Override
    public Boolean sendByTemplate(ExtendMsgSendVO data) {
        R<Boolean> result = msgApi.sendByTemplate(data);
        return result.getIsSuccess() && result.getData();
    }
}
