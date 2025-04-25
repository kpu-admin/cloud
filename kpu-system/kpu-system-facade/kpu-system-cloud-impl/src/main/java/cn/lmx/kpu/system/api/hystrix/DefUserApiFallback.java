package cn.lmx.kpu.system.api.hystrix;

import org.springframework.stereotype.Component;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.model.entity.system.SysUser;
import cn.lmx.kpu.model.vo.result.UserQuery;
import cn.lmx.kpu.system.api.DefUserApi;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 用户API熔断
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
public class DefUserApiFallback implements DefUserApi {
    @Override
    public R<List<Long>> findAllUserId() {
        return R.timeout();
    }

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return Map.of();
    }

    @Override
    public R<SysUser> getById(UserQuery userQuery) {
        return R.timeout();
    }
}
