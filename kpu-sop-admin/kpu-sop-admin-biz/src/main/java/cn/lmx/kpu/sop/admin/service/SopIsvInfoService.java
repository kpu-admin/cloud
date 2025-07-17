package cn.lmx.kpu.sop.admin.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.common.utils.RSATool;
import cn.lmx.kpu.sop.admin.entity.SopIsvInfo;
import cn.lmx.kpu.sop.admin.vo.result.SopIsvKeysResultVO;
import cn.lmx.kpu.sop.admin.vo.update.SopIsvInfoUpdateKeysVO;


/**
 * <p>
 * 业务接口
 * isv信息表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
public interface SopIsvInfoService extends SuperService<Long, SopIsvInfo> {

    RSATool.KeyStore createKeys(RSATool.KeyFormat format) throws Exception;

    SopIsvKeysResultVO getKeys(Long isvId);

    Boolean updateKeys(SopIsvInfoUpdateKeysVO sopIsvInfoUpdateKeysVO);
}


