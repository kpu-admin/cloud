package cn.lmx.kpu.sop.sdk.request;

import cn.lmx.kpu.sop.sdk.response.GetProductResponse;

public class GetProductRequest extends BaseRequest<GetProductResponse> {
    @Override
    protected String method() {
        return "product.get";
    }

}
