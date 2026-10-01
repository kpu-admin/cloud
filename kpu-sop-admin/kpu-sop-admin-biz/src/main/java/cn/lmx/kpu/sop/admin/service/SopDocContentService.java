package cn.lmx.kpu.sop.admin.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.admin.entity.SopDocContent;


/**
 * <p>
 * 业务接口
 * 文档内容
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface SopDocContentService extends SuperService<Long, SopDocContent> {

    void saveContent(Long id, String content);

    String getContent(Long id);
}


