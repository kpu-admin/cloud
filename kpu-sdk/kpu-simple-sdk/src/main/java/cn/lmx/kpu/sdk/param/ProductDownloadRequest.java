package cn.lmx.kpu.sdk.param;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author lmx
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ProductDownloadRequest extends DownloadParam {
    @Override
    protected String method() {
        return "openapi.download";
    }

}
