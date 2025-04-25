package cn.lmx.kpu.gateway.service;

import cn.lmx.basic.interfaces.echo.EchoService;

/**
 * 这个类仅仅是为了防止在gateway启动报错
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
public class GarbageEchoServiceImpl implements EchoService {

    @Override
    public void action(Object obj, boolean isUseCache, String... ignoreFields) {

    }
}
