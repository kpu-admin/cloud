package cn.lmx.kpu.gateway.service.dubbo;

import cn.lmx.kpu.gateway.manager.ApiManager;
import cn.lmx.kpu.gateway.manager.IsvApiPermissionManager;
import cn.lmx.kpu.gateway.manager.IsvManager;
import cn.lmx.kpu.gateway.manager.SecretManager;
import com.gitee.sop.support.service.RefreshService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author 六如
 */
@DubboService
@Slf4j
public class RefreshServiceImpl implements RefreshService {
 
    @Autowired
    private IsvManager isvManager;
    @Autowired
    private SecretManager secretManager;
    @Autowired
    private IsvApiPermissionManager isvApiPermissionManager;
    @Autowired
    private ApiManager apiManager;

    @Override
    public void refreshApi(List<Long> apiIds) {
        apiManager.refresh(apiIds);
    }

    @Override
    public void refreshIsv(List<String> appIds) {
        isvManager.refresh(appIds);
    }

    @Override
    public void refreshIsvPerm(List<Long> isvIds) {
        isvApiPermissionManager.refresh(isvIds);
    }


    @Override
    public void refreshSecret(List<Long> isvIds) {
        secretManager.refresh(isvIds);
    }
}
