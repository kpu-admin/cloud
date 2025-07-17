package cn.lmx.kpu.common.support;

import java.util.List;

public interface TreeNode<T, I> {
    I takeId();

    I takeParentId();

    void setChildren(List<T> var1);
}