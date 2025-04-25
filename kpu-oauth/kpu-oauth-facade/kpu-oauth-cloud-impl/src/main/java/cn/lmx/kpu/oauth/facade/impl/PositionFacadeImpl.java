package cn.lmx.kpu.oauth.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.oauth.api.PositionApi;
import cn.lmx.kpu.oauth.facade.PositionFacade;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;

/**
 * 实现
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service(EchoApi.POSITION_ID_CLASS)
@RequiredArgsConstructor
public class PositionFacadeImpl implements PositionFacade {
    @Autowired
    @Lazy  // 一定要延迟加载，否则kpu-gateway-server无法启动
    private PositionApi positionApi;

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return positionApi.findByIds(ids);
    }
}
