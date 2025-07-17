//package cn.lmx.kpu.system.controller.tenant;
//
//import cn.lmx.basic.annotation.log.WebLog;
//import cn.lmx.basic.base.R;
//import io.swagger.v3.oas.annotations.Operation;
//import io.swagger.v3.oas.annotations.tags.Tag;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.validation.annotation.Validated;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@Slf4j
//@Validated
//@RequiredArgsConstructor
//@RestController
//@RequestMapping("/defTenant")
//@Tag(name="企业")
//public class DefTenantController extends SuperCacheController<DefTenantService, Long, DefTenant, DefTenantSaveVO, DefTenantUpdateVO, DefTenantPageQuery, DefTenantResultVO> {
//
//    /**
//     * 初始化数据
//     */
//    @Operation(summary= "初始化数据")
//    @PostMapping("/initData")
//    @WebLog("连接数据源")
//    public R<Boolean> initData(@Validated @RequestBody DefTenantInitVO tenantConnect) {
//        return success(superService.initData(tenantConnect));
//    }
//
//}
