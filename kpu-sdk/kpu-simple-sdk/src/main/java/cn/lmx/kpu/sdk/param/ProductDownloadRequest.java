package cn.lmx.kpu.sdk.param;

import lombok.Data;

/**
 * @author 六如
 */
@Data
public class ProductDownloadRequest extends DownloadParam {
    @Override
    protected String method() {
        return "openapi.download";
    }

}
