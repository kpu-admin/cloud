package cn.lmx.kpu.sop.sdk.request;

import lombok.Data;

/**
 * @author 六如
 */
@Data
public class ProductDownloadRequest extends DownloadRequest {
    @Override
    protected String method() {
        return "product.download";
    }

}
