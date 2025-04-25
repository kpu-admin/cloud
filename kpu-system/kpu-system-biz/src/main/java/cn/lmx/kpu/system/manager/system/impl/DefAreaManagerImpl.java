package cn.lmx.kpu.system.manager.system.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.system.entity.system.DefArea;
import cn.lmx.kpu.system.manager.system.DefAreaManager;
import cn.lmx.kpu.system.mapper.system.DefAreaMapper;

/**
 * <p>
 * 通用业务实现类
 * 地区表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DefAreaManagerImpl extends SuperManagerImpl<DefAreaMapper, DefArea> implements DefAreaManager {
}
