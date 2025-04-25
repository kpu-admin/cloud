package cn.lmx.kpu.job.facade.impl;

import cn.hutool.http.HttpRequest;
import cn.hutool.json.JSONUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.job.dto.XxlJobInfoVO;
import cn.lmx.kpu.job.facade.JobFacade;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service
@RequiredArgsConstructor
public class JobFacadeImpl implements JobFacade {
    @Value("${kpu.feign.job-server:http://127.0.0.1:8767}")
    private String jobServerUrl;

    @Override
    public R<String> addTimingTask(XxlJobInfoVO xxlJobInfo) {
        String URL = "/xxl-job-admin/jobinfo/save";
        String result = HttpRequest.post(jobServerUrl + URL)
                .body(JSONUtil.toJsonStr(xxlJobInfo))
                .timeout(20000)//超时，毫秒
                .execute().body();
        return R.success(result);
    }


}
