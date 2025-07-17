package cn.lmx.kpu.sop.admin.service.impl;

import cn.hutool.core.convert.Convert;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.common.utils.RSATool;
import cn.lmx.kpu.sop.admin.entity.SopIsvKeys;
import cn.lmx.kpu.sop.admin.eunm.AuditStatusEnum;
import cn.lmx.kpu.sop.admin.service.SopIsvKeysService;
import cn.lmx.kpu.sop.admin.vo.result.SopIsvKeysResultVO;
import cn.lmx.kpu.sop.admin.vo.save.SopIsvInfoSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopIsvInfoUpdateKeysVO;
import com.baidu.fsg.uid.UidGenerator;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopIsvInfoService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopIsvInfoManager;
import cn.lmx.kpu.sop.admin.entity.SopIsvInfo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>
 * 业务实现类
 * isv信息表
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
public class SopIsvInfoServiceImpl extends SuperServiceImpl<SopIsvInfoManager, Long, SopIsvInfo> implements SopIsvInfoService {
    private final SopIsvKeysService sopIsvKeysService;
    private final UidGenerator uidGenerator;
    @Override
    protected <SaveVO> SopIsvInfo saveBefore(SaveVO saveVO) {
        String appKey = new SimpleDateFormat("yyyyMMdd").format(new Date()) + uidGenerator.getUid();
        SopIsvInfoSaveVO sopIsvInfoSaveVO = (SopIsvInfoSaveVO) saveVO;
        sopIsvInfoSaveVO.setAppId(appKey);
        sopIsvInfoSaveVO.setAuditStatus(Convert.toInt(AuditStatusEnum.PASS.getValue()));
        return super.saveBefore(sopIsvInfoSaveVO);
    }

    @Override
    public RSATool.KeyStore createKeys(RSATool.KeyFormat keyFormat) throws Exception {
        if (keyFormat == null) {
            keyFormat = RSATool.KeyFormat.PKCS8;
        }
        RSATool rsaTool = new RSATool(keyFormat, RSATool.KeyLength.LENGTH_2048);
        return rsaTool.createKeys();
    }
    @Override
    public SopIsvKeysResultVO getKeys(Long isvId) {
        SopIsvKeys isvKeys = sopIsvKeysService.getSuperManager().getOne(
                Wrappers.<SopIsvKeys>lambdaQuery().eq(SopIsvKeys::getIsvId, isvId).last(" limit 1")
        );
        SopIsvKeysResultVO isvKeysDTO;
        if (isvKeys == null) {
            isvKeysDTO = new SopIsvKeysResultVO();
            isvKeysDTO.setIsvId(isvId);
            isvKeysDTO.setKeyFormat(RSATool.KeyFormat.PKCS8.getValue());
            isvKeysDTO.setPublicKeyIsv("");
            isvKeysDTO.setPrivateKeyIsv("");
            isvKeysDTO.setPublicKeyPlatform("");
            isvKeysDTO.setPrivateKeyPlatform("");
        } else {
            isvKeysDTO = BeanPlusUtil.toBean(isvKeys, SopIsvKeysResultVO.class);
        }

        SopIsvInfo isvInfo = this.getById(isvId);
        isvKeysDTO.setAppId(isvInfo.getAppId());

        return isvKeysDTO;
    }
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Boolean updateKeys(SopIsvInfoUpdateKeysVO sopIsvInfoUpdateKeysVO) {
        return sopIsvKeysService.saveKeys(sopIsvInfoUpdateKeysVO);
    }

}


