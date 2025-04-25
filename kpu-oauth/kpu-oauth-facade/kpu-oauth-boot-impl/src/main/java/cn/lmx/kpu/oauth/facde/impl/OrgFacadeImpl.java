package cn.lmx.kpu.oauth.facde.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.base.service.user.BaseOrgService;
import cn.lmx.kpu.model.constant.EchoApi;
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
    private final BaseOrgService baseOrgService;

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return baseOrgService.findByIds(ids);
    }
}
