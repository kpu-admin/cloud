package cn.lmx.kpu.gateway.manager;


import cn.lmx.kpu.gateway.common.ApiInfoDTO;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * isv接口授权管理
 *
 * @author 六如
 */
public interface IsvApiPermissionManager extends Manager<List<Long>, Map<Long, List<Long>>> {

    /**
     * isv是否可以访问接口
     *
     * @param isvId      isvId
     * @param apiInfoDTO apiInfoDTO
     * @return true:能访问
     */
    boolean hasPermission(Long isvId, ApiInfoDTO apiInfoDTO);
}
