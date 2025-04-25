package cn.lmx.kpu.generator.manager.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.generator.entity.DefGenTableColumn;
import cn.lmx.kpu.generator.manager.DefGenTableColumnManager;
import cn.lmx.kpu.generator.mapper.DefGenTableColumnMapper;

import java.util.Collection;

/**
 * <p>
 * 通用业务实现类
 * 代码生成字段
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DefGenTableColumnManagerImpl extends SuperManagerImpl<DefGenTableColumnMapper, DefGenTableColumn> implements DefGenTableColumnManager {
    @Override
    public boolean removeByTableIds(Collection<Long> idList) {
        if (CollUtil.isEmpty(idList)) {
            return false;
        }
        return remove(Wrappers.<DefGenTableColumn>lambdaQuery().in(
                DefGenTableColumn::getTableId, idList
        ));
    }
}
