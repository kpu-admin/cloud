package cn.lmx.kpu.shop.event;

import cn.lmx.kpu.shop.event.model.LoginStatusDTO;
import org.springframework.context.ApplicationEvent;

/**
 * 登录事件
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class LoginEvent extends ApplicationEvent {
    public LoginEvent(LoginStatusDTO source) {
        super(source);
    }
}
