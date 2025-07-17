package cn.lmx.kpu.sop.admin.service.impl;

import cn.lmx.kpu.sop.admin.dto.torna.TornaModuleDTO;
import cn.lmx.kpu.sop.admin.service.SopDocInfoService;
import cn.lmx.kpu.sop.admin.service.TornaClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopDocAppService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopDocAppManager;
import cn.lmx.kpu.sop.admin.entity.SopDocApp;

/**
 * <p>
 * 业务实现类
 * 文档应用
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 * @create [2025-07-06 19:04:42] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopDocAppServiceImpl extends SuperServiceImpl<SopDocAppManager, Long, SopDocApp> implements SopDocAppService {
    private final TornaClient tornaClient;
    private final SopDocInfoService sopDocInfoService;
    @Override
    public <SaveVO> SopDocApp save(SaveVO saveVO) {
        SopDocApp sopDocApp = super.saveBefore(saveVO);
        String token = sopDocApp.getToken();
        TornaModuleDTO tornaModuleDTO = tornaClient.execute("module.get", null, token, TornaModuleDTO.class);
        SopDocApp docApp = getSuperManager().lambdaQuery()
                .eq(SopDocApp::getToken, token)
                .last("limit 1")
                .one();
        if (docApp == null) {
            docApp = new SopDocApp();
            docApp.setAppName(tornaModuleDTO.getName());
            docApp.setToken(token);
            getSuperManager().save(docApp);
        } else {
            docApp.setAppName(tornaModuleDTO.getName());
            getSuperManager().updateById(docApp);
        }
        // 同步文档
        sopDocInfoService.syncDocInfo(docApp, null);
        return docApp;
    }

    @Override
    protected <SaveVO> void saveAfter(SaveVO saveVO, SopDocApp entity) {

        super.saveAfter(saveVO, entity);
    }
}


