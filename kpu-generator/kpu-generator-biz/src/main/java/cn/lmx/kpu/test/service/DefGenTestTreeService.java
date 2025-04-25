package cn.lmx.kpu.test.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.test.entity.DefGenTestTree;
import cn.lmx.kpu.test.vo.query.DefGenTestTreePageQuery;

import java.util.List;


/**
 * <p>
 * 业务接口
 * 测试树结构
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface DefGenTestTreeService extends SuperService<Long, DefGenTestTree> {

    /**
     * 查询树结构
     *
     * @param query 参数
     * @return 树
     */
    List<DefGenTestTree> findTree(DefGenTestTreePageQuery query);
}


