package cn.lmx.kpu.gateway.manager;

/**
 * @param <T> 入参
 * @param <R> 出参
 * @author lmx
 */
public interface Manager<T, R> {

    R refresh(T id);

    default void init() {

    }

}
