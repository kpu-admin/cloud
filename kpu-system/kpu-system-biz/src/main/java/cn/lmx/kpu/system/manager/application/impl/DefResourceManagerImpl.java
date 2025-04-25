package cn.lmx.kpu.system.manager.application.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.basic.utils.TreeUtil;
import cn.lmx.kpu.common.cache.tenant.application.ResourceCacheKeyBuilder;
import cn.lmx.kpu.system.entity.application.DefResource;
import cn.lmx.kpu.system.manager.application.DefResourceManager;
import cn.lmx.kpu.system.mapper.application.DefResourceMapper;

import java.io.Serializable;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

/**
 * 应用管理
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@RequiredArgsConstructor
@Service
public class DefResourceManagerImpl extends SuperCacheManagerImpl<DefResourceMapper, DefResource> implements DefResourceManager {


    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new ResourceCacheKeyBuilder();
    }

    @Override
    public List<DefResource> findResourceListByApplicationId(List<Long> applicationIdList, final Collection<String> resourceTypeList) {
        if (CollUtil.isEmpty(applicationIdList)) {
            // 查询所有的菜单
            return super.list(Wraps.<DefResource>lbQ().eq(DefResource::getState, true).orderByAsc(DefResource::getSortValue));
        } else {
            // 新方法
            List<Long> resourceIdSet = addApplicationResourceIdList(applicationIdList);
            return findByIdsAndType(resourceIdSet, resourceTypeList);
        }
    }

    private List<Long> addApplicationResourceIdList(List<Long> applicationIdList) {
        LbQueryWrap<DefResource> wrap = Wraps.<DefResource>lbQ().select(DefResource::getId).in(DefResource::getApplicationId, applicationIdList).eq(DefResource::getState, true);
        return super.listObjs(wrap, Convert::toLong);
    }

    @Override
    public List<DefResource> findByIdsAndType(Collection<? extends Serializable> idList, Collection<String> types) {
        List<DefResource> list = findByIds(idList, null);
        return list.stream()
                // 过滤数据状态
                .filter(Objects::nonNull).filter(DefResource::getState).filter(item -> !CollUtil.isNotEmpty(types) || (CollUtil.contains(types, item.getResourceType())))
                // 按sortValue排序，null排在最后
                .sorted(Comparator.comparing(DefResource::getSortValue, Comparator.nullsLast(Integer::compareTo))).toList();
    }

    @Override
    public List<DefResource> findByApplicationId(List<Long> applicationIds) {
        ArgumentAssert.notEmpty(applicationIds, "applicationIds 不能为空");
        return list(Wraps.<DefResource>lbQ().in(DefResource::getApplicationId, applicationIds).orderByAsc(DefResource::getSortValue));
    }

    @Override
    public Integer maxSortValueByParentIdAndApplicationId(Long parentId, Long applicationId) {
        return baseMapper.maxSortValueByParentIdAndApplicationId(parentId, applicationId);
    }

    @Override
    public Integer maxSortValueByTypeAndParentIdAndApplicationId(List<String> types, Long parentId, Long applicationId) {
        return baseMapper.maxSortValueByTypeAndParentIdAndApplicationId(types,parentId, applicationId);

    }

    @Override
    public List<DefResource> findChildrenByParentId(Long parentId) {
        ArgumentAssert.notNull(parentId, "parentId 不能为空");
        return list(Wraps.<DefResource>lbQ().in(DefResource::getParentId, parentId).orderByAsc(DefResource::getSortValue));
    }

    @Override
    public int deleteRoleResourceRelByResourceId(List<Long> resourceIds) {
        return baseMapper.deleteRoleResourceRelByResourceId(resourceIds);
    }

    @Override
    public List<DefResource> findAllChildrenByParentId(Long parentId) {
        ArgumentAssert.notNull(parentId, "parentId 不能为空");
        return list(Wraps.<DefResource>lbQ().like(DefResource::getTreePath, TreeUtil.buildTreePath(parentId)).orderByAsc(DefResource::getSortValue));
    }


}
