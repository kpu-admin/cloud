package cn.lmx.kpu.job.facade;

import cn.lmx.basic.base.R;
import cn.lmx.kpu.job.dto.XxlJobInfoVO;

/**
 * @author lmx
 * @since 2025-01-01 00:00
 */
public interface JobFacade {
    /**
     * 定时发送接口
     *
     * @param xxlJobInfo 任务
     * @return 任务id
     */
    R<String> addTimingTask(XxlJobInfoVO xxlJobInfo);

}
