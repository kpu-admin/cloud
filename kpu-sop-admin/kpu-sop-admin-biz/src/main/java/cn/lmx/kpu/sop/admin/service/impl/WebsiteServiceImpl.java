package cn.lmx.kpu.sop.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.common.utils.TreeUtil;
import cn.lmx.kpu.sop.admin.constants.YesOrNo;
import cn.lmx.kpu.sop.admin.dto.torna.TornaDocInfoViewDTO;
import cn.lmx.kpu.sop.admin.entity.SopDocApp;
import cn.lmx.kpu.sop.admin.entity.SopDocInfo;
import cn.lmx.kpu.sop.admin.manager.SopSysConfigManager;
import cn.lmx.kpu.sop.admin.service.SopDocAppService;
import cn.lmx.kpu.sop.admin.service.SopDocInfoService;
import cn.lmx.kpu.sop.admin.service.SopSysConfigService;
import cn.lmx.kpu.sop.admin.service.WebsiteService;
import cn.lmx.kpu.sop.admin.vo.result.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class WebsiteServiceImpl implements WebsiteService {
    private final SopDocAppService docAppService;
    private final SopDocInfoService docInfoService;
    private final SopSysConfigManager sopSysConfigManager;

    @Override
    public List<SopDocAppResultVO> listDocApp() {
        List<SopDocApp> docApps = docAppService.list(Wraps.<SopDocApp>lbQ().eq(SopDocApp::getIsPublish, YesOrNo.YES));
        return BeanPlusUtil.toBeanList(docApps, SopDocAppResultVO.class);
    }

    @Override
    public List<SopDocInfoResultVO> listDocMenuTree(Long docAppId) {
        List<SopDocInfo> list = docInfoService.list(Wraps.<SopDocInfo>lbQ()
                .eq(SopDocInfo::getDocAppId, docAppId)
                .eq(SopDocInfo::getIsPublish, YesOrNo.YES));
        List<SopDocInfoResultVO> tree = BeanUtil.copyToList(list, SopDocInfoResultVO.class);

        return TreeUtil.convertTree(tree, 0L);
    }

    @Override
    public DocInfoViewVO getDocDetail(Long id) {
        DocInfoViewVO docInfoViewVO = new DocInfoViewVO();
        TornaDocInfoViewVO docInfo = docInfoService.getDocDetail(id);
        docInfoViewVO.setDocInfoView(docInfo);
        docInfoViewVO.setDocInfoConfig(buildDocInfoConfig());
        return docInfoViewVO;
    }

    private DocInfoConfigVO buildDocInfoConfig() {

        DocInfoConfigVO docInfoConfig = new DocInfoConfigVO();
        docInfoConfig.setOpenProdUrl(sopSysConfigManager.getValueByKey("admin.open-prod-url"));
        docInfoConfig.setOpenSandboxUrl(sopSysConfigManager.getValueByKey("admin.open-sandbox-url"));
        return docInfoConfig;
    }
}
