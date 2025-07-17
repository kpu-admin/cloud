package cn.lmx.kpu.sop.sdk.common;

import cn.lmx.kpu.sop.sdk.sign.StringUtils;
import com.alibaba.fastjson2.annotation.JSONField;
import lombok.Data;

/**
 * @author 六如
 */
@Data
public class Result<T> {
    private String code;
    private String msg;
    private String subCode;
    private String subMsg;
    private T data;

    @JSONField(serialize = false)
    public boolean isSuccess() {
        return StringUtils.isEmpty(subCode);
    }

}
