package cn.lmx.kpu.sdk.param;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 六如
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ProductDownloadRequest extends DownloadParam {
    @Override
    protected String method() {
        return "openapi.download";
    }

}
