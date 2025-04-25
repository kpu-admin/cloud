package cn.lmx.kpu.system.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.system.api.DefUserApi;
import cn.lmx.kpu.system.facade.DefUserFacade;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service(EchoApi.DEF_USER_ID_CLASS)
@RequiredArgsConstructor
public class DefUserFacadeImpl implements DefUserFacade {
    @Autowired
    @Lazy  // 一定要延迟加载，否则kpu-gateway-server无法启动
    private DefUserApi defUserApi;

    @Override
    public R<List<Long>> findAllUserId() {
        return defUserApi.findAllUserId();
    }

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return defUserApi.findByIds(ids);
    }

}

