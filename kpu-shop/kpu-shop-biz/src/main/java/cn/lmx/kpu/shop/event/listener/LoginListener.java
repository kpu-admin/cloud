package cn.lmx.kpu.shop.event.listener;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.shop.event.LoginEvent;
import cn.lmx.kpu.shop.event.model.LoginStatusDTO;
import cn.lmx.kpu.shop.service.user.MemberUserService;
import cn.lmx.kpu.system.enumeration.system.LoginStatusEnum;
import cn.lmx.kpu.system.service.system.DefLoginLogService;
import cn.lmx.kpu.system.vo.save.system.DefLoginLogSaveVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * 登录事件监听，用于记录登录日志
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class LoginListener {
    private final DefLoginLogService defLoginLogService;
    private final MemberUserService memberUserService;

    @Async
    @EventListener({LoginEvent.class})
    public void saveSysLog(LoginEvent event) {
        LoginStatusDTO loginStatus = (LoginStatusDTO) event.getSource();
        MemberUser memberUser;
        if (loginStatus.getUserId() != null) {
            memberUser = this.memberUserService.getByIdCache(loginStatus.getUserId());
        } else if (StrUtil.isNotEmpty(loginStatus.getMobile())) {
            memberUser = this.memberUserService.getUserByMobile(loginStatus.getMobile());
        } else {
            memberUser = this.memberUserService.getUserByUsername(loginStatus.getUsername());
        }

        if (LoginStatusEnum.SUCCESS.eq(loginStatus.getStatus())) {
            // 重置错误次数 和 最后登录时间
            this.memberUserService.resetPassErrorNum(loginStatus.getUserId());
        } else if (LoginStatusEnum.PASSWORD_ERROR.eq(loginStatus.getStatus())) {
            // 密码错误
            this.memberUserService.incrPasswordErrorNumById(loginStatus.getUserId());
        }
        DefLoginLogSaveVO saveVO = BeanUtil.toBean(loginStatus, DefLoginLogSaveVO.class);
        if (memberUser != null) {
            saveVO.setUsername(memberUser.getUsername()).setUserId(memberUser.getId()).setNickName(memberUser.getNickName())
                    .setCreatedBy(memberUser.getId());
        }
        defLoginLogService.save(saveVO);
    }

}
