package cn.lmx.kpu.msg.api.fallback;

import org.springframework.stereotype.Component;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.msg.api.MsgApi;
import cn.lmx.kpu.msg.vo.update.ExtendMsgSendVO;

/**
 * 熔断
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
public class MsgApiFallback implements MsgApi {
    @Override
    public R<Boolean> sendByTemplate(ExtendMsgSendVO data) {
        return R.timeout();
    }
}
