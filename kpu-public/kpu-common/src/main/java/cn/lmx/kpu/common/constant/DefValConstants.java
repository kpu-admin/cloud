package cn.lmx.kpu.common.constant;

import cn.lmx.basic.utils.TreeUtil;

/**
 * 默认值
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DefValConstants {
    /** 内置的租户 */
    Long DEF_TENANT_ID = 1L;
    /**
     * 默认的树节点 分隔符
     */
    String TREE_PATH_SPLIT = TreeUtil.TREE_SPLIT;

    /**
     * 默认树层级
     */
    Integer TREE_GRADE = 0;
    /**
     * 默认的父id
     */
    Long PARENT_ID = TreeUtil.DEF_PARENT_ID;

    /**
     * 默认的排序
     */
    Integer SORT_VALUE = 0;

    /** 防止字典空值导致的 缓存击穿问题 */
    String DICT_NULL_VAL_KEY = "-999999999";
}
