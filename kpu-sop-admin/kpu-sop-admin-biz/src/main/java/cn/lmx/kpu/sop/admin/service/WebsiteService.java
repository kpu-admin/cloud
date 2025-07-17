package cn.lmx.kpu.sop.admin.service;

import cn.lmx.kpu.sop.admin.vo.result.DocInfoViewVO;
import cn.lmx.kpu.sop.admin.vo.result.SopDocAppResultVO;
import cn.lmx.kpu.sop.admin.vo.result.SopDocInfoResultVO;

import java.util.List;

public interface WebsiteService {
    List<SopDocAppResultVO> listDocApp();

    List<SopDocInfoResultVO> listDocMenuTree(Long docAppId);

    DocInfoViewVO getDocDetail(Long id);
}
