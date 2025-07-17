package cn.lmx.kpu.gateway.manager.impl;

import cn.lmx.kpu.gateway.manager.IpBlacklistManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * IP黑名单管理
 *
 * @author 六如
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class IpBlacklistManagerImpl implements IpBlacklistManager {
    @Override
    public boolean contains(String ip) {
        return false;
    }
}

