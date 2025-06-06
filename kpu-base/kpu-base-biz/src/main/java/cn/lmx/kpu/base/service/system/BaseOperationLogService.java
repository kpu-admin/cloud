package cn.lmx.kpu.base.service.system;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.base.entity.system.BaseOperationLog;
import cn.lmx.kpu.base.vo.result.system.BaseOperationLogResultVO;

import java.time.LocalDateTime;

/**
 * <p>
 * 业务接口
 * 操作日志
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface BaseOperationLogService extends SuperService<Long, BaseOperationLog> {
    /**
     * 清理日志
     *
     * @param clearBeforeTime 多久之前的
     * @param clearBeforeNum  多少条
     * @return 是否成功
     */
    boolean clearLog(LocalDateTime clearBeforeTime, Integer clearBeforeNum);


    /**
     * 根据id查询详情
     *
     * @param id id
     * @return cn.lmx.kpu.system.result.vo.base.kpu.BaseOperationLogResultVO
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    BaseOperationLogResultVO getDetail(Long id);
}
