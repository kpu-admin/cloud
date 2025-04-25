package cn.lmx.kpu.system.facade;

import java.util.Map;
import java.util.Set;

/**
 * 资源
 * @author lmx
 * @since 2025-01-01 00:00
 */
public interface DefResourceFacade {
    /** 查询系统的所有资源API */
    Map<String, Set<String>> listAllApi();
}
