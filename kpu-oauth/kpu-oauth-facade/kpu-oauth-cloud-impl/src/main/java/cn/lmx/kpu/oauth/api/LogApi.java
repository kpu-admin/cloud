package cn.lmx.kpu.oauth.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import cn.lmx.basic.constant.Constants;
import cn.lmx.basic.model.log.OptLogDTO;

/**
 * 操作日志保存 API
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@FeignClient(name = "${" + Constants.PROJECT_PREFIX + ".feign.oauth-server:kpu-oauth-server}")
public interface LogApi {

    /**
     * 保存日志
     *
     * @param log 操作日志
     */
    @RequestMapping(value = "/optLog", method = RequestMethod.POST)
    void save(@RequestBody OptLogDTO log);

}
