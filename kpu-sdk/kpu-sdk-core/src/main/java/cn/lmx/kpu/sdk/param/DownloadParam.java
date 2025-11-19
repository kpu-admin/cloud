package cn.lmx.kpu.sdk.param;


import cn.lmx.kpu.sdk.common.FileResult;
import cn.lmx.kpu.sdk.common.UploadFile;

import java.util.List;

/**
 * @author 六如
 */
public abstract class DownloadParam extends BaseParam<List<UploadFile>, FileResult> implements DownloadAware {

    @Override
    protected Class<FileResult> parseResponseClass() {
        return FileResult.class;
    }
}
