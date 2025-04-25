package cn.lmx.kpu.msg.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.msg.entity.DefMsgTemplate;

/**
 * <p>
 * 通用业务接口
 * 消息模板
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface DefMsgTemplateManager extends SuperManager<DefMsgTemplate> {
    /**
     * 根据消息模板编码查询消息模板
     *
     * @param code
     * @return
     */
    DefMsgTemplate getByCode(String code);
}


