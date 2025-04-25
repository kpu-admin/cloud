package cn.lmx.kpu.system.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.system.facade.DefUserFacade;
import cn.lmx.kpu.system.service.tenant.DefUserService;

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
    private final DefUserService defUserService;

    @Override
    public R<List<Long>> findAllUserId() {
        return R.success(defUserService.findUserIdList(null));
    }

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return defUserService.findByIds(ids);
    }

}
