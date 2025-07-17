package cn.lmx.kpu.sop.admin.service.impl;

import cn.lmx.basic.database.mybatis.conditions.Wraps;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopDocContentService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopDocContentManager;
import cn.lmx.kpu.sop.admin.entity.SopDocContent;

/**
 * <p>
 * 业务实现类
 * 文档内容
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
public class SopDocContentServiceImpl extends SuperServiceImpl<SopDocContentManager, Long, SopDocContent> implements SopDocContentService {


    public void saveContent(Long docInfoId, String content) {
        SopDocContent docContent = this.superManager.getOne(Wraps.<SopDocContent>lbQ()
                .eq(SopDocContent::getDocInfoId, docInfoId)
                .last("limit 1")
        );
        boolean save = false;
        if (docContent == null) {
            save = true;
            docContent = new SopDocContent();
        }
        docContent.setDocInfoId(docInfoId);
        docContent.setContent(content);
        if (save) {
            this.save(docContent);
        } else {
            this.updateById(docContent);
        }
    }

    @Override
    public String getContent(Long docInfoId) {

        SopDocContent docContent = superManager.getOne(Wraps.<SopDocContent>lbQ()
                .eq(SopDocContent::getDocInfoId, docInfoId)
                .last("limit 1"));
        return docContent == null ? null : docContent.getContent();
    }

}


