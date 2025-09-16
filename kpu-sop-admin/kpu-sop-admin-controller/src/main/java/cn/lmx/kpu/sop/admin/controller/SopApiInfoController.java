package cn.lmx.kpu.sop.admin.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.request.PageParams;
import cn.lmx.basic.database.mybatis.conditions.query.QueryWrap;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.sop.admin.service.SopPermGroupPermissionService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.kpu.sop.admin.service.SopApiInfoService;
import cn.lmx.kpu.sop.admin.entity.SopApiInfo;
import cn.lmx.kpu.sop.admin.vo.save.SopApiInfoSaveVO;
import cn.lmx.kpu.sop.admin.vo.update.SopApiInfoUpdateVO;
import cn.lmx.kpu.sop.admin.vo.result.SopApiInfoResultVO;
import cn.lmx.kpu.sop.admin.vo.query.SopApiInfoPageQuery;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * 接口信息表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 * @create [2025-07-06 19:04:42] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/sopApiInfo")
@Tag(name = "接口信息表")
public class SopApiInfoController extends SuperController<SopApiInfoService, Long, SopApiInfo, SopApiInfoSaveVO, SopApiInfoUpdateVO, SopApiInfoPageQuery, SopApiInfoResultVO> {
    private final EchoService echoService;
    private final SopPermGroupPermissionService sopPermGroupPermissionService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    /**
     * 分页查询
     *
     * @param params 分页参数
     * @return 分页数据s
     */
    @Operation(summary = "分页列表查询")
    @PostMapping(value = "/pageByGroup")
    @WebLog(value = "'分页列表查询:第' + #params?.current + '页, 显示' + #params?.size + '行'", response = false)
    public R<IPage<SopApiInfoResultVO>> pageByGroup(@RequestBody @Validated PageParams<SopApiInfoPageQuery> params) {
        handlerQueryParams(params);

        // 构建分页参数(current、size)和排序字段等
        IPage<SopApiInfo> page = params.buildPage(getEntityClass());
        SopApiInfo model = BeanUtil.toBean(params.getModel(), getEntityClass());

        // 根据前端传递的参数，构建查询条件【提供给子类重写】【有默认实现】
        QueryWrap<SopApiInfo> wrapper = handlerWrapper(model, params);
//        List<Long> apiIds = sopPermGroupPermissionService.list(Wraps.<SopPermGroupPermission>lbQ()
//                        .eq(SopPermGroupPermission::getGroupId, params.getModel().getGroupId())).stream()
//                .map(SopPermGroupPermission::getApiId).toList();
//        if (CollUtil.isEmpty(apiIds)) {
//            return success(BeanPlusUtil.toBeanPage(page, getResultVOClass()));
//        }
        String sql = "select 1 from sop_perm_group_permission pgp where  pgp.api_id = sop_api_info.id and pgp.group_id = {0}";
        wrapper.exists(sql, params.getModel().getGroupId());
//        wrapper.in(SopApiInfo::getId, apiIds);
        // 执行单表分页查询
        getSuperService().page(page, wrapper);
        IPage<SopApiInfoResultVO> voPage = BeanPlusUtil.toBeanPage(page, getResultVOClass());
        // 处理查询后的分页结果， 如：调用EchoService回显字典、关联表数据等 【提供给子类重写】【有默认实现】
        handlerResult(voPage);
        return success(voPage);
    }
}


