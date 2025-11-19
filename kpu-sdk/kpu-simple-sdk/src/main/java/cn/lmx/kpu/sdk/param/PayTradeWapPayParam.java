package cn.lmx.kpu.sdk.param;

import cn.lmx.kpu.sdk.request.PayTradeWapPayRequest;
import cn.lmx.kpu.sdk.response.PayTradeWapPayResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class PayTradeWapPayParam extends BaseParam<PayTradeWapPayRequest, PayTradeWapPayResponse> {
    @Override
    protected String method() {
        return "openapi.trade.wap.pay";
    }
}
