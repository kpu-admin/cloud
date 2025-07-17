package cn.lmx.kpu.gateway.manager;

/**
 * IP黑名单管理
 *
 * @author 六如
 */
public interface IpBlacklistManager {

    boolean contains(String ip);

}
