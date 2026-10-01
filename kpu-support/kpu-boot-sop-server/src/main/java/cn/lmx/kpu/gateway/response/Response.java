package cn.lmx.kpu.gateway.response;

import com.alibaba.fastjson2.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author lmx
 */
public interface Response {

    String getCode();

    Object getData();

    @JSONField(serialize = false)
    @JsonIgnore
    default boolean needWrap() {
        return true;
    }
}
