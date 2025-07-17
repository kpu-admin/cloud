package cn.lmx.kpu.sop.admin.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.admin.entity.SopIsvKeys;
import cn.lmx.kpu.sop.admin.vo.update.SopIsvInfoUpdateKeysVO;


/**
 * <p>
 * 业务接口
 * ISV秘钥管理
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
public interface SopIsvKeysService extends SuperService<Long, SopIsvKeys> {

    Boolean saveKeys(SopIsvInfoUpdateKeysVO sopIsvInfoUpdateKeysVO);
}


