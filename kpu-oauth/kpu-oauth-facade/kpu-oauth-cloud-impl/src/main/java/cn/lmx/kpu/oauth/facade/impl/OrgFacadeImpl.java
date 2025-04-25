package cn.lmx.kpu.oauth.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.oauth.api.OrgApi;
import cn.lmx.kpu.oauth.facade.OrgFacade;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;

/**
 * 实现
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service(EchoApi.ORG_ID_CLASS)
@RequiredArgsConstructor
public class OrgFacadeImpl implements OrgFacade {
    @Autowired
    @Lazy  // 一定要延迟加载，否则kpu-gateway-server无法启动
    private OrgApi orgApi;

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return orgApi.findByIds(ids);
    }
}
