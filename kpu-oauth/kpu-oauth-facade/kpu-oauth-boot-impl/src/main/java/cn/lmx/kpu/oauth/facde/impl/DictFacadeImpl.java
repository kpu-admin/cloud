package cn.lmx.kpu.oauth.facde.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.oauth.facade.DictFacade;
import cn.lmx.kpu.oauth.service.DictService;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;

/**
 * 字典实现
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service(EchoApi.DICTIONARY_ITEM_FEIGN_CLASS)
@RequiredArgsConstructor
public class DictFacadeImpl implements DictFacade {
    private final DictService dictService;

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return dictService.findByIds(ids);
    }
}
