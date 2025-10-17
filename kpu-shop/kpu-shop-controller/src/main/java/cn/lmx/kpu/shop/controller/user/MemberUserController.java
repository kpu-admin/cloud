package cn.lmx.kpu.shop.controller.user;

import cn.lmx.basic.interfaces.echo.EchoService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.shop.service.user.MemberUserService;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.shop.vo.save.user.MemberUserSaveVO;
import cn.lmx.kpu.shop.vo.update.user.MemberUserUpdateVO;
import cn.lmx.kpu.shop.vo.result.user.MemberUserResultVO;
import cn.lmx.kpu.shop.vo.query.user.MemberUserPageQuery;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * 商城用户
 * </p>
 *
 * @author lmx
 * @date 2025-08-21 02:35:55
 * @create [2025-08-21 02:35:55] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/memberUser")
@Tag(name = "商城用户")
public class MemberUserController extends SuperController<MemberUserService, Long, MemberUser, MemberUserSaveVO, MemberUserUpdateVO, MemberUserPageQuery, MemberUserResultVO> {
    private final EchoService echoService;
    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}


