package cn.lmx.kpu.sop.admin.service;

import cn.hutool.http.HttpUtil;
import cn.lmx.basic.exception.BizException;
import cn.lmx.kpu.sop.admin.manager.SopSysConfigManager;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.util.UriUtils;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author 六如
 */
@Component
public class TornaClient {
    @Autowired
    private SopSysConfigManager sopSysConfigManager;
    @Value("${admin.torna-server-addr}")
    private String tornaServerAddr;
    public <T> T execute(String name, Object param, String token, Class<T> respClass) {
        JSONObject data = request(name, param, token).getJSONObject("data");
        return data.toJavaObject(respClass);
    }

    public <T> List<T> executeList(String name, Object param, String token, Class<T> respClass) {
        JSONArray data = request(name, param, token).getJSONArray("data");
        return data.toList(respClass);
    }

    private JSONObject request(String name, Object param, String token) {
        Map<String, Object> params = new HashMap<>();
        params.put("name", name);
        params.put("access_token", token);
        if (param != null) {
            String json = JSON.toJSONString(param);
            params.put("data", UriUtils.encode(json, StandardCharsets.UTF_8));
        }
        String body = HttpUtil.post(getTornaApiUrl(), JSON.toJSONString(params));
        JSONObject jsonObject = JSON.parseObject(body);
        if (!Objects.equals("0", jsonObject.getString("code"))) {
            throw new BizException(jsonObject.getString("msg"));
        }
        return jsonObject;
    }

    public String getTornaApiUrl() {
        String value = sopSysConfigManager.getValueByKey("admin.torna-server-addr");
        if (value == null) {
            value = tornaServerAddr;
        }
        if (ObjectUtils.isEmpty(value)) {
            throw new BizException("Torna服务器地址未配置");
        }
        return StringUtils.trimTrailingCharacter(value, '/') + "/api";
    }

}
