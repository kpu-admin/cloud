package cn.lmx.kpu.oauth.service;

import cn.lmx.basic.interfaces.echo.LoadService;
import cn.lmx.kpu.system.vo.result.system.DefDictItemResultVO;
import cn.lmx.kpu.system.vo.result.system.DefDictResultVO;

import java.util.List;
import java.util.Map;

/**
 * 字典查询服务
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DictService extends LoadService {
    List<DefDictResultVO> findAll();

    Map<String, List<DefDictItemResultVO>> findDictItemByType(List<String> query);

    void syncEnumToDict();
}
