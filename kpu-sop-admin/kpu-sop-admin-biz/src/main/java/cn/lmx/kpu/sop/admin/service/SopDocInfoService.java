package cn.lmx.kpu.sop.admin.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.admin.entity.SopDocApp;
import cn.lmx.kpu.sop.admin.entity.SopDocInfo;
import cn.lmx.kpu.sop.admin.vo.query.SopDocInfoPageQuery;
import cn.lmx.kpu.sop.admin.vo.result.SopDocInfoResultVO;
import cn.lmx.kpu.sop.admin.vo.result.TornaDocInfoViewVO;
import cn.lmx.kpu.sop.admin.vo.update.SopDocInfoUpdateVO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * <p>
 * 业务接口
 * 文档信息
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 * @create [2025-07-06 19:04:42] [lmx] [代码生成器生成]
 */
public interface SopDocInfoService extends SuperService<Long, SopDocInfo> {

    /**
     * 查询树结构
     *
     * @param query 参数
     * @return 树
     */
    List<SopDocInfoResultVO> findTree(SopDocInfoPageQuery query);

    void syncAppDoc(Long id);

    void syncDoc(Long id);

    boolean publish(SopDocInfoUpdateVO param);

    void syncDocInfo(SopDocApp docApp, Long docInfoId);

    TornaDocInfoViewVO getDocDetail(Long id);
}


