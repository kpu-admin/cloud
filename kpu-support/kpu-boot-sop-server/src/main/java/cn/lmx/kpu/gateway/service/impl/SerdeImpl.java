package cn.lmx.kpu.gateway.service.impl;

import cn.lmx.kpu.gateway.config.ApiConfig;
import cn.lmx.kpu.gateway.service.Serde;
import cn.lmx.kpu.gateway.util.XmlUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONWriter;
import com.fasterxml.jackson.core.JsonProcessingException;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.util.Map;

/**
 * @author 六如
 */
public class SerdeImpl implements Serde {

    static JSONWriter.Context writeContext;

    @Autowired
    protected ApiConfig apiConfig;

    @Value("${gateway.serialize.date-format}")
    protected String dateFormat;

    @Override
    public String toJson(Object object) {
        return JSON.toJSONString(object, writeContext);
    }

    @Override
    public String toXml(Object object) {
        try {
            return XmlUtil.toXml(object);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Map<String, Object> parseJson(String json) {
        return JSON.parseObject(json);
    }

    @PostConstruct
    public void init() {
        writeContext = new JSONWriter.Context();
        writeContext.setDateFormat(dateFormat);

        this.doInit();
    }

    protected void doInit() {

    }
}
