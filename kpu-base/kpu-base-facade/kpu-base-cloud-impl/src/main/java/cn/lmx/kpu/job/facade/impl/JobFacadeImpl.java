package cn.lmx.kpu.job.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.job.api.JobApi;
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
    @Autowired
    @Lazy  // 一定要延迟加载，否则kpu-gateway-server无法启动
    private JobApi jobApi;

    @Override
    public R<String> addTimingTask(XxlJobInfoVO xxlJobInfo) {
        return jobApi.addTimingTask(xxlJobInfo);
    }
}
