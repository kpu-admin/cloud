package cn.lmx.kpu.oauth.facade;

import cn.lmx.basic.model.log.OptLogDTO;

/**
 * 操作日志保存 API
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface LogFacade {

    /**
     * 保存日志
     *
     * @param log 操作日志
     */
    void save(OptLogDTO log);

}
