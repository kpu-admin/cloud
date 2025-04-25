package cn.lmx.kpu.job.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import cn.lmx.basic.base.R;
import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.job.dto.XxlJobInfoVO;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@FeignClient(name = "JobApi", url = "${" + Constants.PROJECT_PREFIX + ".feign.job-server:http://127.0.0.1:8767}", path = "/xxl-job-admin")
public interface JobApi {
    /**
     * 定时发送接口
     *
     * @param xxlJobInfo
     * @return
     */
    @RequestMapping(value = "/jobinfo/save", method = RequestMethod.POST)
    R<String> addTimingTask(@RequestBody XxlJobInfoVO xxlJobInfo);

}
