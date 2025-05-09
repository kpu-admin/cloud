package cn.lmx.kpu.msg.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.jackson.JsonUtil;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.job.dto.XxlJobInfoVO;
import cn.lmx.kpu.job.facade.JobFacade;
import cn.lmx.kpu.model.entity.system.SysUser;
import cn.lmx.kpu.msg.entity.DefMsgTemplate;
import cn.lmx.kpu.msg.entity.ExtendMsg;
import cn.lmx.kpu.msg.entity.ExtendMsgRecipient;
import cn.lmx.kpu.msg.entity.ExtendNotice;
import cn.lmx.kpu.msg.enumeration.MsgTemplateTypeEnum;
import cn.lmx.kpu.msg.enumeration.SourceType;
import cn.lmx.kpu.msg.enumeration.TaskStatus;
import cn.lmx.kpu.msg.event.MsgEventVO;
import cn.lmx.kpu.msg.event.MsgSendEvent;
import cn.lmx.kpu.msg.manager.ExtendMsgManager;
import cn.lmx.kpu.msg.manager.ExtendMsgRecipientManager;
import cn.lmx.kpu.msg.manager.ExtendNoticeManager;
import cn.lmx.kpu.msg.service.ExtendMsgService;
import cn.lmx.kpu.msg.vo.result.ExtendMsgResultVO;
import cn.lmx.kpu.msg.vo.update.ExtendMsgPublishVO;
import cn.lmx.kpu.msg.vo.update.ExtendMsgSendVO;
import cn.lmx.kpu.msg.ws.WebSocketSubject;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 业务实现类
 * 消息
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */

@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class ExtendMsgServiceImpl extends SuperServiceImpl<ExtendMsgManager, Long, ExtendMsg> implements ExtendMsgService {
    @Autowired
    private ExtendMsgRecipientManager extendMsgRecipientManager;
    @Autowired
    private ExtendNoticeManager extendNoticeManager;
    @Autowired
    private JobFacade jobFacde;

    @Override
    public ExtendMsgResultVO getResultById(Long id) {
        ExtendMsg msg = superManager.getById(id);
        ExtendMsgResultVO result = BeanUtil.toBean(msg, ExtendMsgResultVO.class);
        if (result != null) {
            List<ExtendMsgRecipient> list = extendMsgRecipientManager.listByMsgId(id);
            result.setRecipientList(list.stream().map(ExtendMsgRecipient::getRecipient).toList());
        }
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean publish(ExtendMsgPublishVO data, SysUser sysUser) {
        ExtendMsg extendMsg = BeanUtil.toBean(data, ExtendMsg.class);
        extendMsg.setType(MsgTemplateTypeEnum.NOTICE.getCode());
        extendMsg.setChannel(SourceType.APP);

        extendMsg.setCreatedOrgId(sysUser.getEmployee() != null ? sysUser.getEmployee().getLastDeptId() : null);
        if (data != null && data.getDraft() != null && data.getDraft()) {
            extendMsg.setStatus(TaskStatus.DRAFT);
        } else {
            extendMsg.setStatus(TaskStatus.WAITING);
        }
        if (extendMsg.getId() == null) {
            superManager.save(extendMsg);
        } else {
            superManager.updateById(extendMsg);
            extendMsgRecipientManager.remove(Wraps.<ExtendMsgRecipient>lbQ().eq(ExtendMsgRecipient::getMsgId, extendMsg.getId()));
        }
        List<ExtendMsgRecipient> recipientList = data.getRecipientList().stream().map((item) -> {
            ExtendMsgRecipient recipient = new ExtendMsgRecipient();
            recipient.setMsgId(extendMsg.getId());
            recipient.setRecipient(item);
            return recipient;
        }).toList();
        extendMsgRecipientManager.saveBatch(recipientList);

        if (data.getSendTime() == null) {
            List<ExtendNotice> noticeList = data.getRecipientList().stream().map((item) -> {
                ExtendNotice notice = new ExtendNotice();
                BeanUtil.copyProperties(extendMsg, notice);
                notice.setId(null);
                notice.setMsgId(extendMsg.getId());
                notice.setRecipientId(Long.valueOf(item));
                notice.setIsHandle(false);
                notice.setIsRead(false);
                notice.setHandleTime(null);
                notice.setReadTime(null);
                notice.setAutoRead(true);
                return notice;
            }).toList();
            extendNoticeManager.saveBatch(noticeList);

            data.getRecipientList().forEach(employeeId -> {
                WebSocketSubject subject = WebSocketSubject.Holder.getSubject(employeeId);
                // 通知客户端 接收消息
                subject.notify("1", null);
            });

            extendMsg.setStatus(TaskStatus.SUCCESS);
            superManager.updateById(extendMsg);
        } else {
            // 务必启动 kpu-job-pro 项目，否则调用会失败！
            Map<String, Long> param = MapUtil.builder("msgId", extendMsg.getId()).build();

            XxlJobInfoVO xxlJobInfoVO = XxlJobInfoVO.create("kpu-job-executor-none",
                    "【发送消息】" + extendMsg.getTitle(), extendMsg.getSendTime(), "publishMsg", JsonUtil.toJson(param));
            jobFacde.addTimingTask(xxlJobInfoVO);
        }
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void publishNotice(Long msgId) {
        ExtendMsg extendMsg = superManager.getById(msgId);
        ArgumentAssert.notNull(extendMsg, "消息不存在");
        List<ExtendMsgRecipient> recipientList = extendMsgRecipientManager.listByMsgId(extendMsg.getId());
        ArgumentAssert.notEmpty(recipientList, "消息接收人为空");

        List<ExtendNotice> noticeList = recipientList.stream().map((item) -> {
            ExtendNotice notice = new ExtendNotice();
            BeanUtil.copyProperties(extendMsg, notice);
            notice.setId(null);
            notice.setMsgId(extendMsg.getId());
            notice.setRecipientId(Long.valueOf(item.getRecipient()));
            notice.setIsHandle(false);
            notice.setIsRead(false);
            notice.setHandleTime(null);
            notice.setReadTime(null);
            notice.setAutoRead(true);
            return notice;
        }).toList();
        extendNoticeManager.saveBatch(noticeList);

        recipientList.forEach(employeeId -> {
            WebSocketSubject subject = WebSocketSubject.Holder.getSubject(employeeId);
            // 通知客户端 接收消息
            subject.notify("1", null);
        });

        extendMsg.setStatus(TaskStatus.SUCCESS);
        superManager.updateById(extendMsg);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean send(ExtendMsgSendVO data, DefMsgTemplate msgTemplate, SysUser sysUser) {
        ExtendMsg extendMsg = BeanUtil.toBean(data, ExtendMsg.class);
        extendMsg.setTemplateCode(data.getCode());
        extendMsg.setChannel(SourceType.SERVICE);
        extendMsg.setType(msgTemplate.getType());
        extendMsg.setRemindMode(msgTemplate.getRemindMode());
        if (CollUtil.isNotEmpty(data.getParamList())) {
            extendMsg.setParam(JsonUtil.toJson(data.getParamList()));
        }
        extendMsg.setCreatedOrgId((sysUser != null && sysUser.getEmployee() != null) ? sysUser.getEmployee().getLastDeptId() : null);

        extendMsg.setStatus(TaskStatus.WAITING);
        if (extendMsg.getId() == null) {
            superManager.save(extendMsg);
        } else {
            superManager.updateById(extendMsg);
            extendMsgRecipientManager.remove(Wraps.<ExtendMsgRecipient>lbQ().eq(ExtendMsgRecipient::getMsgId, extendMsg.getId()));
        }

        List<ExtendMsgRecipient> recipientList = data.getRecipientList().stream().map((item) -> {
            ExtendMsgRecipient recipient = new ExtendMsgRecipient();
            recipient.setMsgId(extendMsg.getId());
            recipient.setRecipient(item.getRecipient());
            recipient.setExt(item.getExt());
            return recipient;
        }).toList();
        extendMsgRecipientManager.saveBatch(recipientList);

        //3, 判断是否立即发送
        if (data.getSendTime() == null) {
            MsgEventVO msgEventVO = new MsgEventVO();
            msgEventVO.setMsgId(extendMsg.getId()).copy();
            SpringUtils.publishEvent(new MsgSendEvent(msgEventVO));
        } else {
            // 务必启动 kpu-job-pro 项目，否则调用会失败！
            Map<String, Long> param = MapUtil.builder("msgId", extendMsg.getId()).build();

            XxlJobInfoVO xxlJobInfoVO = XxlJobInfoVO.create("kpu-job-executor-none",
                    "【发送消息】" + extendMsg.getTitle(), extendMsg.getSendTime(), "sendMsg", JsonUtil.toJson(param));
            jobFacde.addTimingTask(xxlJobInfoVO);
        }
        return true;
    }

}


