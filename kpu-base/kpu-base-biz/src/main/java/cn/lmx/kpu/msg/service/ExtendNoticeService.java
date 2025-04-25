package cn.lmx.kpu.msg.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import cn.lmx.basic.base.request.PageParams;
import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.msg.entity.ExtendNotice;
import cn.lmx.kpu.msg.vo.query.ExtendNoticePageQuery;
import cn.lmx.kpu.msg.vo.result.ExtendNoticeResultVO;

import java.util.List;


/**
 * <p>
 * 业务接口
 * 通知表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface ExtendNoticeService extends SuperService<Long, ExtendNotice> {

    /**
     * 分页查询
     *
     * @param page
     * @param params
     * @return
     */
    IPage<ExtendNoticeResultVO> page(IPage<ExtendNoticeResultVO> page, PageParams<ExtendNoticePageQuery> params);

    /**
     * 标记 已读
     *
     * @param noticeIds
     * @param employeeId
     * @return
     */
    Boolean mark(List<Long> noticeIds, Long employeeId);

    /**
     * 删除我的通知
     *
     * @param noticeIds
     * @return
     */
    Boolean deleteMyNotice(List<Long> noticeIds);
}


