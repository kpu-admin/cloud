package cn.lmx.kpu.sop.admin.service.impl;

import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.admin.entity.SopPermIsvGroup;
import cn.lmx.kpu.sop.admin.manager.SopPermIsvGroupManager;
import cn.lmx.kpu.sop.admin.vo.save.SopPermIsvGroupSaveVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopPermGroupService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopPermGroupManager;
import cn.lmx.kpu.sop.admin.entity.SopPermGroup;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>
 * 业务实现类
 * 分组表
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:41
 * @create [2025-07-06 19:04:41] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopPermGroupServiceImpl extends SuperServiceImpl<SopPermGroupManager, Long, SopPermGroup> implements SopPermGroupService {
    private final SopPermIsvGroupManager sopPermIsvGroupManager;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateIsvGroup(SopPermIsvGroupSaveVO param) {
        sopPermIsvGroupManager.remove(Wraps.<SopPermIsvGroup>lbQ()
                .eq(SopPermIsvGroup::getIsvId, param.getIsvId())
        );
        for (String groupId : param.getGroupIdList()) {
            SopPermIsvGroup sopPermIsvGroup = new SopPermIsvGroup();
            sopPermIsvGroup.setIsvId(param.getIsvId());
            sopPermIsvGroup.setGroupId(Long.valueOf(groupId));
            sopPermIsvGroupManager.save(sopPermIsvGroup);
        }
    }

    @Override
    public List<Long> listByGroupId(String isvId) {
        return sopPermIsvGroupManager.list(Wraps.<SopPermIsvGroup>lbQ().eq(SopPermIsvGroup::getIsvId, isvId)).stream()
                .filter(Objects::nonNull).map(SopPermIsvGroup::getGroupId)
                .distinct().collect(Collectors.toList());
    }
}


