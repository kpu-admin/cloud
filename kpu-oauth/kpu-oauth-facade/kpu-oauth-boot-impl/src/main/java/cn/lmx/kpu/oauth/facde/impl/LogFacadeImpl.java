package cn.lmx.kpu.oauth.facde.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.model.log.OptLogDTO;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.base.service.system.BaseOperationLogService;
import cn.lmx.kpu.base.vo.save.system.BaseOperationLogSaveVO;
import cn.lmx.kpu.oauth.facade.LogFacade;

/**
 * 操作日志保存 API
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Service
@RequiredArgsConstructor
public class LogFacadeImpl implements LogFacade {
    private final BaseOperationLogService baseOperationLogService;

    /**
     * 保存日志
     *
     * @param data 操作日志
     * @return 操作日志
     */
    public void save(OptLogDTO data) {
        BaseOperationLogSaveVO bean = BeanPlusUtil.toBean(data, BaseOperationLogSaveVO.class);
        baseOperationLogService.save(bean);
    }

}
