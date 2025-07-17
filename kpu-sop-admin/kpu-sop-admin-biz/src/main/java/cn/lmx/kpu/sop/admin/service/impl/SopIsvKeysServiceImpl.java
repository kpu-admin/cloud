package cn.lmx.kpu.sop.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.admin.vo.update.SopIsvInfoUpdateKeysVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopIsvKeysService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopIsvKeysManager;
import cn.lmx.kpu.sop.admin.entity.SopIsvKeys;

/**
 * <p>
 * 业务实现类
 * ISV秘钥管理
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopIsvKeysServiceImpl extends SuperServiceImpl<SopIsvKeysManager, Long, SopIsvKeys> implements SopIsvKeysService {


    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveKeys(SopIsvInfoUpdateKeysVO sopIsvInfoUpdateKeysVO) {
        SopIsvKeys isvKeys = superManager.getOne(Wraps.<SopIsvKeys>lbQ().eq(SopIsvKeys::getIsvId, sopIsvInfoUpdateKeysVO.getIsvId())
                .last(" limit 1")
        );
        if (isvKeys == null) {
            isvKeys = new SopIsvKeys();
        }
        BeanUtil.copyProperties(sopIsvInfoUpdateKeysVO, isvKeys);
        Boolean bol = superManager.saveOrUpdate(isvKeys);
        // TODO 发送变更事件
        // 发送变更事件
//        SpringUtils.publishEvent(new ChangeIsvKeyEvent(Collections.singletonList(sopIsvInfoUpdateKeysVO.getIsvId())));
        return bol;
    }
}


