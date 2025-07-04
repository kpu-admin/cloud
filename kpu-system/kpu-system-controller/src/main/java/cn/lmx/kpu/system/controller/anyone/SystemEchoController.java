package cn.lmx.kpu.system.controller.anyone;

import cn.lmx.basic.annotation.response.IgnoreResponseBodyAdvice;
import cn.lmx.kpu.system.service.tenant.DefUserService;
import io.swagger.v3.oas.annotations.Hidden;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;

/**
 * 数据注入的查询实现类
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@RestController
@AllArgsConstructor()
@RequestMapping("/echo")
@IgnoreResponseBodyAdvice
@Tag(name = "数据注入查询接口， 不建议前端调用")
@Hidden
public class SystemEchoController {
    private final DefUserService defUserService;

    @Operation(summary = "根据id查询用户", description = "根据id查询用户")
    @PostMapping("/user/findByIds")
    public Map<Serializable, Object> findUserByIds(@RequestParam(value = "ids") Set<Serializable> ids) {
        return defUserService.findByIds(ids);
    }

}
