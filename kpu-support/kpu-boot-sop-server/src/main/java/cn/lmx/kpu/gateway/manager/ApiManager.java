package cn.lmx.kpu.gateway.manager;


import cn.lmx.kpu.gateway.common.ApiInfoDTO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Supplier;

/**
 * @author 六如
 */
public interface ApiManager extends Manager<List<Long>, Map<Long, ApiInfoDTO>> {

    void save(ApiInfoDTO apiInfoDTO);

    ApiInfoDTO get(String apiName, String apiVersion);

    default ApiInfoDTO getOrElse(String apiName, String apiVersion, Supplier<ApiInfoDTO> supplier) {
        ApiInfoDTO apiInfoDTO = get(apiName, apiVersion);
        if (apiInfoDTO == null) {
            apiInfoDTO = supplier.get();
        }
        if (apiInfoDTO != null) {
            save(apiInfoDTO);
        }
        return apiInfoDTO;
    }

}
