package cn.lmx.kpu.sop.sdk.request;

import cn.lmx.kpu.sop.sdk.common.FileResult;

/**
 * @author 六如
 */
public abstract class DownloadRequest extends BaseRequest<FileResult> implements DownloadAware {

    @Override
    protected Class<FileResult> parseResponseClass() {
        return FileResult.class;
    }
}
