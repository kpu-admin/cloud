package cn.lmx.kpu.oauth.service;

import cn.lmx.basic.interfaces.echo.LoadService;
import cn.lmx.kpu.model.vo.result.Option;
import cn.lmx.kpu.oauth.vo.param.CodeQueryVO;
import cn.lmx.kpu.system.vo.result.system.DefDictItemResultVO;

import java.util.List;
import java.util.Map;

/**
 * 字典查询服务
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DictService extends LoadService {
    /**
     * 根据字典key查询字典条目
     * <p>
     * 1. 先查询租户自己的字典项。
     * 2. 若不存在，则查询系统默认的字典项
     *
     * @param dictKeys 字典key
     * @return key： 字典key  value: item list
     */
    Map<String, List<DefDictItemResultVO>> findDictMapByType(List<String> dictKeys);

    List<Option> findEnumByType(CodeQueryVO type);

    Map<String, List<Option>> findEnumMapByType(List<CodeQueryVO> types);

    Map<String, List<Option>> mapOptionByDict(Map<String, List<DefDictItemResultVO>> map, List<CodeQueryVO> codeQueryVO);

    List<Option> mapOptionByDict(Map<String, List<DefDictItemResultVO>> map, CodeQueryVO codeQueryVO);
}
