package cn.lmx.kpu.common.utils;


import cn.lmx.kpu.common.support.TreeNode;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class TreeUtil {
    public static <I, T extends TreeNode<T, I>> List<T> convertTree(List<T> list, I parentId) {
        if (list == null) {
            return new ArrayList();
        } else {
            List<T> temp = new ArrayList();

            for (int i = 0; i < list.size(); ++i) {
                T item = (T) (list.get(i));
                if (Objects.equals(item.takeParentId(), parentId)) {
                    List<T> children = convertTree(list, item.takeId());
                    item.setChildren(children);
                    temp.add(item);
                }
            }

            return temp;
        }
    }
}