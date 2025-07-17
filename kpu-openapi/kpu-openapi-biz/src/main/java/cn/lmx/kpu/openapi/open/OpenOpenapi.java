package cn.lmx.kpu.openapi.open;

import cn.lmx.kpu.openapi.open.req.PayOrderSearchRequest;
import cn.lmx.kpu.openapi.open.req.PayTradeWapPayRequest;
import cn.lmx.kpu.openapi.open.req.ProductSaveRequest;
import cn.lmx.kpu.openapi.open.resp.PayOrderSearchResponse;
import cn.lmx.kpu.openapi.open.resp.PayTradeWapPayResponse;
import cn.lmx.kpu.openapi.open.resp.ProductResponse;
import com.gitee.sop.support.annotation.Open;
import com.gitee.sop.support.dto.FileData;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.List;

/**
 * 支付接口
 *
 * @author 六如
 */
public interface OpenOpenapi {

    /**
     * 手机网站支付接口
     *
     * @apiNote 该接口是页面跳转接口，用于生成用户访问跳转链接。
     * 请在服务端执行SDK中pageExecute方法，读取响应中的body()结果。
     * 该结果用于跳转到页面，返回到用户浏览器渲染或重定向跳转到页面。
     * 具体使用方法请参考 <a href="https://torna.cn" target="_blank">接入指南</a>
     */
    @Open("openapi.trade.wap.pay")
    PayTradeWapPayResponse tradeWapPay(PayTradeWapPayRequest request);


    /**
     * 订单查询接口
     *
     * @param request
     * @return
     */
    @Open("openapi.order.search")
    PayOrderSearchResponse orderSearch(PayOrderSearchRequest request);

    // 演示单文件上传
    @Open("openapi.upload")
    ProductResponse upload(ProductSaveRequest request, FileData file);

    // 演示多文件上传
    @Open("openapi.upload.more")
    ProductResponse upload2(
            ProductSaveRequest request,
            @NotNull(message = "身份证正面必填") FileData idCardFront,
            @NotNull(message = "身份证背面必填") FileData idCardBack
    );

    // 演示多文件上传
    @Open("openapi.upload.list")
    ProductResponse upload3(ProductSaveRequest request, @Size(min = 2, message = "最少上传2个文件") List<FileData> files);

    // 下载
    @Open("openapi.download")
    FileData download(Integer id);
}
