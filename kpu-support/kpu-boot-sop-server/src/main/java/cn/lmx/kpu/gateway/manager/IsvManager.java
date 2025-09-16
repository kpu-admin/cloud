package cn.lmx.kpu.gateway.manager;


import cn.lmx.kpu.sop.admin.dto.IsvDTO;

import java.util.List;
import java.util.Map;

/**
 * @author 六如
 */
public interface IsvManager extends Manager<List<String>, Map<String, IsvDTO>> {

    /**
     * 获取isv信息
     *
     * @param appId appId
     * @return 返回isv信息, 没有返回null
     */
    IsvDTO getIsv(String appId);
}
