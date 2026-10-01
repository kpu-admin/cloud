package cn.lmx.kpu.gateway.manager;

/**
 * IP黑名单管理
 *
 * @author lmx
 */
public interface IpBlacklistManager {

    boolean contains(String ip);

}
