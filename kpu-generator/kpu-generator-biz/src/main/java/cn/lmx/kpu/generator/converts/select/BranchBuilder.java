package cn.lmx.kpu.generator.converts.select;

import java.util.function.Function;
import java.util.function.Predicate;

/**
 * 分支构建者
 *
 * @author hanchunlin
 * @author lmx
 * Created at 2025-01-01 00:00
 */
public interface BranchBuilder<P, T> {

    /**
     * 工厂函数，用于创建分支构建者
     *
     * @param tester 测试器
     * @param <P>    参数类型
     * @param <T>    返回值类型
     * @return 返回一个分支创建者
     */
    static <P, T> BranchBuilder<P, T> of(Predicate<P> tester) {
        return factory -> Branch.of(tester, factory);
    }

    /**
     * 使用一个值工厂构造出一个分支
     *
     * @param factory 值工厂
     * @return 返回分支
     */
    Branch<P, T> then(Function<P, T> factory);

    /**
     * 从值构建出一个分支
     *
     * @param value 值
     * @return 返回一个分支
     */
    default Branch<P, T> then(T value) {
        return then(p -> value);
    }

}

