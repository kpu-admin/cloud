package cn.lmx.kpu.sop.sdk.request;

import cn.lmx.kpu.sop.sdk.response.PayTradeWapPayResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * pay.trade.wap.pay(手机网站支付接口)
 *
 * @author 六如
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class PayTradeWapPayRequest extends BaseRequest<PayTradeWapPayResponse> {

    private String outTradeNo;

    private BigDecimal totalAmount;

    private String subject;

    private String productCode;

    @Override
    protected String method() {
        return "pay.trade.wap.pay";
    }
}
