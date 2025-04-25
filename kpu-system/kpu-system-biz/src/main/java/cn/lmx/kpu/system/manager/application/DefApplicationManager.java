package cn.lmx.kpu.system.manager.application;

import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.basic.interfaces.echo.LoadService;
import cn.lmx.kpu.system.entity.application.DefApplication;
import cn.lmx.kpu.system.vo.result.application.DefApplicationResultVO;

import java.util.List;

/**
 * 应用管理
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
public interface DefApplicationManager extends SuperCacheManager<DefApplication>, LoadService {

    /**
     * 查询我的应用
     *
     * @param name 应用名
     * @return
     */
    List<DefApplicationResultVO> findMyApplication(String name);

    /**
     * 查询推荐应用
     *
     * @param name 应用名
     * @return
     */
    List<DefApplicationResultVO> findRecommendApplication(String name);

    /**
     * 查询公共应用
     *
     * @return
     */
    List<DefApplication> findGeneral();

}
