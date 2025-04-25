package cn.lmx.kpu.msg.event;

import org.springframework.context.ApplicationEvent;

/**
 * 登录事件
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class MsgSendEvent extends ApplicationEvent {
    public MsgSendEvent(MsgEventVO msg) {
        super(msg);
    }
}
