package cn.lmx.kpu.sop.sdk.request;

import lombok.Data;

import java.math.BigDecimal;

/**
 * pay.trade.wap.pay(手机网站支付接口)
 *
 * @author 六如
 */
@Data
public class PayTradeWapPayModel {

    private String outTradeNo;

    private BigDecimal totalAmount;

    private String subject;

    private String productCode;

}
