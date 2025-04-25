package cn.lmx.kpu.msg.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.annotation.user.LoginUser;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.kpu.model.entity.system.SysUser;
import cn.lmx.kpu.msg.biz.MsgBiz;
import cn.lmx.kpu.msg.vo.update.ExtendMsgSendVO;

/**
 * <p>
 * 前端控制器
 * 消息
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/anyUser")
@Tag(name = "消息模版")
public class MsgController {
    private final MsgBiz msgBiz;


    @Operation(summary = "根据模板发送消息", description = "根据模板发送消息")
    @PostMapping("/extendMsg/sendByTemplate")
    @WebLog("发送消息")
    public R<Boolean> sendByTemplate(@RequestBody @Validated(SuperEntity.Update.class) ExtendMsgSendVO data
            , @Parameter(hidden = true) @LoginUser(isEmployee = true) SysUser sysUser) {
        return R.success(msgBiz.sendByTemplate(data, sysUser));
    }

}


