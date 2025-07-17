package cn.lmx.kpu.sop.sdk.request;

import cn.lmx.kpu.sop.sdk.response.OpenAuthTokenAppResponse;

/**
 * @author 六如
 */
public class OpenAuthTokenAppRequest extends BaseRequest<OpenAuthTokenAppResponse> {
    @Override
    protected String method() {
        return "open.auth.token.app";
    }
}
