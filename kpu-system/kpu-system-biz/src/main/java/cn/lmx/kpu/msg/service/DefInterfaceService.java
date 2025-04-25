package cn.lmx.kpu.msg.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.msg.entity.DefInterface;


/**
 * <p>
 * 业务接口
 * 接口
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface DefInterfaceService extends SuperService<Long, DefInterface> {
    /**
     * 检查接口编码是否重复
     *
     * @param code
     * @param id
     * @return
     */
    Boolean check(String code, Long id);
}


