package cn.lmx.kpu.sop.sdk.request;


import cn.lmx.kpu.sop.sdk.response.GetProductResponse;

/**
 * @author 六如
 */
public class DemoFileUploadRequest extends BaseRequest<GetProductResponse> {
    @Override
    protected String method() {
        return "product.upload.more";
    }
}
