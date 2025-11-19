package cn.lmx.kpu.sdk.param;


import cn.lmx.kpu.sdk.request.GetProductRequest;
import cn.lmx.kpu.sdk.response.GetProductResponse;

/**
 * @author 六如
 */
public class DemoFileUploadRequest extends BaseParam<GetProductRequest, GetProductResponse> {
    @Override
    protected String method() {
        return "openapi.upload.more";
    }
}
