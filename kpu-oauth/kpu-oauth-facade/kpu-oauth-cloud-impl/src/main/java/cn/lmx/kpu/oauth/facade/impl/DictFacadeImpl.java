package cn.lmx.kpu.oauth.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.oauth.api.DictApi;
import cn.lmx.kpu.oauth.facade.DictFacade;

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
    @Autowired
    @Lazy  // 一定要延迟加载，否则kpu-gateway-server无法启动
    private DictApi dictApi;

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return dictApi.findByIds(ids);
    }
}
