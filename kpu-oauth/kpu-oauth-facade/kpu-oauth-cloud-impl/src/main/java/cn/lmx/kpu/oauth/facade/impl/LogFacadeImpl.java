package cn.lmx.kpu.oauth.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.basic.model.log.OptLogDTO;
import cn.lmx.kpu.oauth.api.LogApi;
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
    @Autowired
    @Lazy  // 一定要延迟加载，否则kpu-gateway-server无法启动
    private LogApi logApi;

    /**
     * 保存日志
     *
     * @param data 操作日志
     * @return 操作日志
     */
    public void save(OptLogDTO data) {
        logApi.save(data);
    }

}
