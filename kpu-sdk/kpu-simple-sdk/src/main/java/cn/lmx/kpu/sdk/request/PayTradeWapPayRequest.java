package cn.lmx.kpu.sdk.request;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 这个类的类名可以随意命名，但建议以Request结尾
 * 这个类的字段以及字段类型需要与开放接口中 PayTradeWapPayRequest 类中的字段完全一致。
 */
@Data
public class PayTradeWapPayRequest {

    private String outTradeNo;

    private BigDecimal totalAmount;

    private String subject;

    private String productCode;
}
