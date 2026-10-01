package cn.lmx.kpu.sdk.common;

import lombok.Getter;
import lombok.Setter;
import okhttp3.Headers;

/**
 * @author lmx
 */
@Setter
@Getter
public class FileResult {
    private byte[] fileData;

    private Headers headers;

}
