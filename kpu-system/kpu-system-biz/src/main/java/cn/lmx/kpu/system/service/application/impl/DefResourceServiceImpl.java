package cn.lmx.kpu.system.service.application.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.lmx.basic.base.entity.TreeEntity;
import com.google.common.collect.Multimap;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperCacheServiceImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.exception.BizException;
import cn.lmx.basic.jackson.JsonUtil;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.basic.utils.StrPool;
import cn.lmx.basic.utils.TreeUtil;
import cn.lmx.basic.utils.ValidatorUtil;
import cn.lmx.kpu.common.cache.tenant.application.AllResourceApiCacheKeyBuilder;
import cn.lmx.kpu.common.cache.tenant.application.ApplicationResourceCacheKeyBuilder;
import cn.lmx.kpu.common.cache.tenant.application.ResourceResourceApiCacheKeyBuilder;
import cn.lmx.kpu.common.constant.DefValConstants;
import cn.lmx.kpu.model.enumeration.system.ResourceTypeEnum;
import cn.lmx.kpu.model.vo.result.ResourceApiVO;
import cn.lmx.kpu.system.entity.application.DefResource;
import cn.lmx.kpu.system.entity.application.DefResourceApi;
import cn.lmx.kpu.system.manager.application.DefResourceApiManager;
import cn.lmx.kpu.system.manager.application.DefResourceManager;
import cn.lmx.kpu.system.service.application.DefResourceService;
import cn.lmx.kpu.system.vo.result.application.DefResourceApiResultVO;
import cn.lmx.kpu.system.vo.result.application.DefResourceResultVO;
import cn.lmx.kpu.system.vo.save.application.DefResourceApiSaveVO;
import cn.lmx.kpu.system.vo.save.application.DefResourceSaveVO;
import cn.lmx.kpu.system.vo.update.application.DefResourceUpdateVO;

import java.io.Serializable;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 业务实现类
 * 资源
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)

public class DefResourceServiceImpl extends SuperCacheServiceImpl<DefResourceManager, Long, DefResource> implements DefResourceService {
    private final DefResourceApiManager defResourceApiManager;

    @Override
    public List<ResourceApiVO> findAllApi() {
        return defResourceApiManager.findAllApi();
    }

    @Override
    public Map<Long, Collection<Long>> findResource() {
        List<DefResource> list = super.list(Wraps.<DefResource>lbQ().eq(DefResource::getState, true));
        Multimap<Long, Long> map = CollHelper.iterableToMultiMap(list, DefResource::getApplicationId, DefResource::getId);
        return map.asMap();
    }

    @Override
    public List<DefResource> findResourceListByApplicationId(List<Long> applicationIdList, Collection<String> resourceTypes) {
        return superManager.findResourceListByApplicationId(applicationIdList, resourceTypes);
    }

    @Override
    public List<DefResource> findByIdsAndType(Collection<? extends Serializable> idList, Collection<String> types) {
        return superManager.findByIdsAndType(idList, types);
    }


    @Override
    public Boolean check(Long id, String code) {
        return superManager.count(Wraps.<DefResource>lbQ().ne(DefResource::getId, id).eq(DefResource::getCode, code)) > 0;
    }

    @Override
    public Boolean checkPath(Long id, Long applicationId, String path) {
        return superManager.count(Wraps.<DefResource>lbQ().ne(DefResource::getId, id)
                .eq(DefResource::getApplicationId, applicationId).eq(DefResource::getPath, path)) > 0;
    }

    @Override
    public Boolean checkName(Long id, Long applicationId, String name) {
        return superManager.count(Wraps.<DefResource>lbQ().ne(DefResource::getId, id)
                .eq(DefResource::getApplicationId, applicationId)
                .in(DefResource::getResourceType, ResourceTypeEnum.MENU.getCode())
                .eq(DefResource::getName, name)) > 0;
    }

    @Override
    public DefResourceResultVO getResourceById(Long id) {
        DefResource defResource = getById(id);
        if (defResource == null) {
            return null;
        }
        DefResourceResultVO vo = BeanPlusUtil.toBean(defResource, DefResourceResultVO.class);
        List<DefResourceApi> resourceApis = defResourceApiManager.findByResourceId(id);
        vo.setResourceApiList(BeanPlusUtil.toBeanList(resourceApis, DefResourceApiResultVO.class));
        return vo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeByIdWithCache(List<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return false;
        }
//        long count = superManager.count(Wraps.<DefResource>lbQ().in(DefResource::getParentId, ids));
//        ArgumentAssert.isFalse(count > 0, "您要删除的资源存在子资源，请先删除子资源！");
        long count = superManager.count(Wraps.<DefResource>lbQ()
                .in(DefResource::getParentId, ids)
                .notIn(DefResource::getId, ids)
        );
        ArgumentAssert.isFalse(count > 0, "您要删除的资源存在子资源，请先删除子资源！");
        List<DefResource> defResources = superManager.listByIds(ids);
        List<Long> applicationIdList = defResources.stream().map(DefResource::getApplicationId).distinct().toList();
        cacheOps.del(applicationIdList.stream().map(ApplicationResourceCacheKeyBuilder::build).toList());

        boolean result = this.removeByIds(ids);
        defResourceApiManager.removeByResourceId(ids);
        cacheOps.del(AllResourceApiCacheKeyBuilder.builder());
        // TODO 删除租户下的 角色资源关系表 员工资源关系表
        // deleteRoleResourceRelByResourceId(ids);
        return result;
    }

    @Override

    @Transactional(rollbackFor = Exception.class)
    public void deleteRoleResourceRelByResourceId(List<Long> resourceIds) {
        superManager.deleteRoleResourceRelByResourceId(resourceIds);
    }

    /**
     * 批量保存资源下绑定的接口
     *
     * @param resourceApiList 接口api
     * @param resourceId      资源id
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    private void saveResourceApi(Long resourceId, List<DefResourceApiSaveVO> resourceApiList) {
        if (CollUtil.isNotEmpty(resourceApiList)) {
            List<DefResourceApi> list =
                    resourceApiList.stream().map(vo -> {
                        DefResourceApi api = new DefResourceApi();
                        BeanPlusUtil.copyProperties(vo, api);
                        api.setResourceId(resourceId);
                        return api;
                    }).toList();
            defResourceApiManager.saveBatch(list);
        }
    }

    private void fill(DefResource resource) {
        if (resource.getParentId() == null || resource.getParentId() <= 0) {
            resource.setParentId(DefValConstants.PARENT_ID);
            resource.setTreePath(DefValConstants.TREE_PATH_SPLIT);
            resource.setTreeGrade(DefValConstants.TREE_GRADE);
        } else {
            DefResource parent = this.superManager.getByIdCache(resource.getParentId());
            ArgumentAssert.notNull(parent, "请正确填写父级");

            resource.setTreeGrade(parent.getTreeGrade() + 1);
            resource.setTreePath(TreeUtil.getTreePath(parent.getTreePath(), parent.getId()));
        }
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void moveResource(Long id, Long parentId) {
        ArgumentAssert.notNull(id, "当前资源信息不存在");

        DefResource current = superManager.getByIdCache(id);
        ArgumentAssert.notNull(current, "当前资源信息不存在");
        List<DefResource> childrenList = superManager.findAllChildrenByParentId(id);


        // 是否跟节点移动到根节点 （跟节点可能为null)
        boolean isTopMoveTop = TreeUtil.isRoot(current.getParentId()) && TreeUtil.isRoot(parentId);
        // 是否自己移动到自己下
        boolean isSelfMoveSelf = current.getParentId() != null && current.getParentId().equals(parentId);
        if (isTopMoveTop || isSelfMoveSelf) {
            log.info("没有改变 id={}, parentId={}", id, parentId);
            return;
        }

        DefResource parent = null;
        if (parentId != null) {
            ArgumentAssert.isFalse(id.equals(parentId), "不能移动到自己的子节点");
            boolean flag = childrenList.stream().anyMatch(item -> item.getId().equals(parentId));
            ArgumentAssert.isFalse(flag, "不能移动到自己的子节点");
            parent = superManager.getByIdCache(parentId);
            ArgumentAssert.notNull(parent, "需要移动到的父资源不存在");
        }

        fill(current, parent);
        if (CollUtil.isNotEmpty(childrenList)) {
            List<DefResource> tree = TreeUtil.buildTree(childrenList);
            recursiveFill(tree, current);

            superManager.updateBatchById(childrenList);
        }
        superManager.updateById(current);

        // 只修改了 父ID、path等字段，清理资源缓存，无需清理 资源API的缓存
        List<Long> allIdList = childrenList.stream().map(DefResource::getId).collect(Collectors.toList());
        allIdList.add(current.getId());
        superManager.delCache(allIdList);
        throw BizException.wrap("移动成功 测试");
    }

    private void recursiveFill(List<DefResource> tree, DefResource parent) {
        int i = 1;
        int b = 100;
        int f = 500;
        int d = 1000;
        for (DefResource node : tree) {
            fill(node, parent);
            if (node.getResourceType().equals(ResourceTypeEnum.MENU.getCode())) {
                node.setSortValue(i++);
            } else if (node.getResourceType().equals(ResourceTypeEnum.BUTTON.getCode())) {
                node.setSortValue(b++);
            } else if (node.getResourceType().equals(ResourceTypeEnum.FIELD.getCode())) {
                node.setSortValue(f++);
            } else if (node.getResourceType().equals(ResourceTypeEnum.DATA.getCode())) {
                node.setSortValue(d++);
            }


            if (CollUtil.isNotEmpty(node.getChildren())) {
                recursiveFill(node.getChildren(), node);
            }
        }
    }

    private void fill(DefResource node, DefResource parent) {
        node.setParentId(parent == null ? DefValConstants.PARENT_ID : parent.getId());
        node.setTreeGrade(parent == null ? DefValConstants.TREE_GRADE : parent.getTreeGrade() + 1);
        node.setTreePath(parent == null ? DefValConstants.TREE_PATH_SPLIT : TreeUtil.getTreePath(parent.getTreePath(), parent.getId()));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public DefResource saveWithCache(DefResourceSaveVO data) {
        if (StrUtil.containsAny(data.getResourceType(), ResourceTypeEnum.MENU.getCode())) {
            ArgumentAssert.notEmpty(data.getPath(), "请填写【地址栏路径】");
            ArgumentAssert.notEmpty(data.getComponent(), "请填写【页面路径】");
            ArgumentAssert.isFalse(checkName(null, data.getApplicationId(), data.getName()), "【名称】:{}重复", data.getName());
            if (!ValidatorUtil.isUrl(data.getPath())) {
                ArgumentAssert.isFalse(checkPath(null, data.getApplicationId(), data.getPath()), "【地址栏路径】:{}重复", data.getPath());
            }
        }
        ArgumentAssert.isFalse(check(null, data.getCode()), "【资源编码】：{}重复", data.getCode());
        data.setMetaJson(parseMetaJson(data.getMetaJson()));
        DefResource resource = BeanPlusUtil.toBean(data, DefResource.class);

        DefResource parent = superManager.getById(data.getParentId());
        if (parent != null) {
            if (ResourceTypeEnum.MENU.eq(data.getResourceType())) {
                ArgumentAssert.isFalse(!ResourceTypeEnum.MENU.eq(parent.getResourceType()),
                        "菜单只能挂载在菜单下级");
                ArgumentAssert.isFalse(parent.getIsHidden() != null && parent.getIsHidden(),
                        "菜单不能挂载在隐藏菜单下级");
            }
        }

        checkGeneral(resource, false);

        fill(resource);
        Integer sortValue = superManager.maxSortValueByTypeAndParentIdAndApplicationId(CollUtil.newArrayList(resource.getResourceType()), resource.getParentId(), resource.getApplicationId());
        if (sortValue == null) {
            resource.setSortValue(1);
            if (ResourceTypeEnum.MENU.eq(data.getResourceType())) {
                resource.setSortValue(1);
            }else if (ResourceTypeEnum.BUTTON.eq(data.getResourceType())) {
                resource.setSortValue(100);
            }else if (ResourceTypeEnum.FIELD.eq(data.getResourceType())) {
                resource.setSortValue(500);
            }else if (ResourceTypeEnum.DATA.eq(data.getResourceType())) {
                resource.setSortValue(1000);
            }
        } else {
            resource.setSortValue(sortValue + 1);
        }
        superManager.save(resource);
        saveResourceApi(resource.getId(), data.getResourceApiList());

        // 淘汰资源下绑定的接口
        cacheOps.del(ResourceResourceApiCacheKeyBuilder.builder(resource.getId()));
        cacheOps.del(AllResourceApiCacheKeyBuilder.builder());
        return resource;
    }

    private String parseMetaJson(String metaJson) {
        if (StrUtil.isNotEmpty(metaJson)) {
            try {
                return JsonUtil.toJson(JsonUtil.parse(metaJson, HashMap.class));
            } catch (Exception e) {
                throw new BizException("【元数据】须满足JSON格式");
            }
        }
        return StrPool.EMPTY;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public DefResource updateWithCacheById(DefResourceUpdateVO data) {
        if (StrUtil.containsAny(data.getResourceType(), ResourceTypeEnum.MENU.getCode())) {
            ArgumentAssert.notEmpty(data.getPath(), "【地址栏路径】不能为空");
            ArgumentAssert.notEmpty(data.getComponent(), "【页面路径】不能为空");
            ArgumentAssert.isFalse(checkName(data.getId(), data.getApplicationId(), data.getName()), "【资源名称】:{}重复", data.getName());
            if (!ValidatorUtil.isUrl(data.getPath())) {
                ArgumentAssert.isFalse(checkPath(data.getId(), data.getApplicationId(), data.getPath()), "【地址栏路径】:{}重复", data.getPath());
            }
        }
        ArgumentAssert.isFalse(check(data.getId(), data.getCode()), "【资源编码】:{}重复", data.getCode());
        data.setMetaJson(parseMetaJson(data.getMetaJson()));

        DefResource resource = BeanPlusUtil.toBean(data, DefResource.class);
        checkGeneral(resource, true);
        fill(resource);
        superManager.updateById(resource);
        defResourceApiManager.removeByResourceId(Collections.singletonList(resource.getId()));
        saveResourceApi(resource.getId(), data.getResourceApiList());

        // 淘汰资源下绑定的接口
        cacheOps.del(ResourceResourceApiCacheKeyBuilder.builder(resource.getId()));
        cacheOps.del(AllResourceApiCacheKeyBuilder.builder());
        return resource;
    }

    private void checkGeneral(DefResource data, boolean isUpdate) {
        final boolean isGeneral = data.getIsGeneral() != null && data.getIsGeneral();
        boolean state = data.getState() == null || data.getState();

        // isGeneral 子节点 改成是，父节点全是
        if (!TreeUtil.isRoot(data.getParentId())) {
            DefResource parent = superManager.getById(data.getParentId());
            ArgumentAssert.notNull(parent, "父节点不存在");
            if (isGeneral) {
                ArgumentAssert.isTrue(parent.getIsGeneral(), "请先将父节点【{}】-“公共资源”字段修改为：“是”，在修改本节点", parent.getName());
            }
            if (state) {
                ArgumentAssert.isTrue(parent.getState(), "请先将父节点【{}】-“状态”字段修改为：“启用”，在修改本节点", parent.getName());
            }
        }

        if (isUpdate) {
            // isGeneral 父节点 改成否，子节点全否
            List<DefResource> childrenList = superManager.findChildrenByParentId(data.getId());
            if (CollUtil.isNotEmpty(childrenList)) {
                childrenList.forEach(item -> {
                    if (!isGeneral) {

                        ArgumentAssert.isFalse(item.getIsGeneral(), "请将所有子节点的“公共资源”修改为”否”后，在修改当前节点", item.getName());
                    }
                    if (!state) {
                        ArgumentAssert.isFalse(item.getState(), "请将所有子节点的“状态”修改为“禁用”后，在修改当前节点");
                    }
                });
            }
        }
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean moveUp(Long id) {
        // 查询菜单是否能上移 不上移的情况：1.没有父节点 2.已经是第一个 否则就报错
        DefResource menu = getById(id);
        ArgumentAssert.notNull(menu, "菜单不存在");
        if (menu.getParentId() == null) {
            throw BizException.wrap("根节点不能移动");
        }
        Long parentId = DefValConstants.PARENT_ID;
        if (!menu.getParentId().equals(DefValConstants.PARENT_ID)) {
            DefResource parent = getById(menu.getParentId());
            ArgumentAssert.notNull(parent, "请正确填写父级");
            parentId = parent.getId();
        }
        List<DefResource> list = list(Wraps.<DefResource>lbQ().eq(DefResource::getResourceType,menu.getResourceType()).eq(DefResource::getParentId, parentId).orderByAsc(DefResource::getSortValue));
        if (list.size() <= 1) {
            throw BizException.wrap("已经是第一个了");
        }
        // 交换位置
        int index = 0;
        for (int i = 0; i < list.size(); i++) {
            DefResource item = list.get(i);
            if (item.getId().equals(id)) {
                index = i;
                break;
            }
        }
        if (index == 0) {
            throw BizException.wrap("已经是资源类型第一个了");
        }
        DefResource pre = list.get(index - 1);
        DefResource current = list.get(index);
        Integer temp = pre.getSortValue();
        pre.setSortValue(current.getSortValue());
        current.setSortValue(temp);
        superManager.updateById(pre);
        superManager.updateById(current);
        superManager.delCache(CollUtil.newArrayList(pre.getId(), current.getId()));
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean moveDown(Long id) {
        // 查询菜单是否能下移 不下移的情况：1.没有父节点 2.已经是最后一个 否则就报错
        DefResource menu = getById(id);
        ArgumentAssert.notNull(menu, "菜单不存在");
        if (menu.getParentId() == null) {
            throw BizException.wrap("根节点不能移动");
        }
        Long parentId = DefValConstants.PARENT_ID;
        if (!menu.getParentId().equals(DefValConstants.PARENT_ID)) {
            DefResource parent = getById(menu.getParentId());
            ArgumentAssert.notNull(parent, "请正确填写父级");
            parentId = parent.getId();
        }
        List<DefResource> list = list(Wraps.<DefResource>lbQ().eq(DefResource::getResourceType,menu.getResourceType()).eq(DefResource::getParentId, parentId).orderByAsc(DefResource::getSortValue));
        if (list.size() <= 1) {
            throw BizException.wrap("已经是资源类型最后一个了");
        }
        // 交换位置
        int index = 0;
        for (int i = 0; i < list.size(); i++) {
            DefResource item = list.get(i);
            if (item.getId().equals(id)) {
                index = i;
                break;
            }
        }
        if (index == list.size() - 1) {
            throw BizException.wrap("已经是最后一个了");
        }
        DefResource next = list.get(index + 1);
        DefResource current = list.get(index);
        Integer temp = next.getSortValue();
        next.setSortValue(current.getSortValue());
        current.setSortValue(temp);
        superManager.updateById(next);
        superManager.updateById(current);
        superManager.delCache(CollUtil.newArrayList(next.getId(), current.getId()));
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean move(Long id, Long parentId) {
        ArgumentAssert.notNull(id, "当前资源信息不存在");
        // 不能移动到当前节点的所有子和孙节点下 不能移动到自己的父节点下 sort_value 当前节点和目标节点重新排序 重新计算层级 重新计算路径
        DefResource current = getByIdCache(id);
        ArgumentAssert.notNull(current, "当前资源信息不存在");
        List<DefResource> childrenList = superManager.findAllChildrenByParentId(id);
        // 是否跟节点移动到根节点 （跟节点可能为null)
        boolean isTopMoveTop = TreeUtil.isRoot(current.getParentId()) && TreeUtil.isRoot(parentId);
        // 是否自己移动到自己下
        boolean isSelfMoveSelf = current.getParentId() != null && current.getParentId().equals(parentId);
        if (isTopMoveTop || isSelfMoveSelf) {
            log.info("没有改变 id={}, parentId={}", id, parentId);
            return false;
        }
        DefResource parent = null;
        if (parentId != null) {
            ArgumentAssert.isFalse(id.equals(parentId), "不能移动到自己的子节点");
            boolean flag = childrenList.stream().anyMatch(item -> item.getId().equals(parentId));
            ArgumentAssert.isFalse(flag, "不能移动到自己的子节点下");
            parent = superManager.getByIdCache(parentId);
            ArgumentAssert.notNull(parent, "需要移动到的父资源不存在");
            ArgumentAssert.isFalse(StrUtil.containsAny(parent.getResourceType(), ResourceTypeEnum.BUTTON.getCode(), ResourceTypeEnum.FIELD.getCode(), ResourceTypeEnum.DATA.getCode()),
                    "按钮、字段、数据权限不能作为父节点");
        }
        List<Long> allIdList = CollUtil.newArrayList();
        //重排当前父节点下的所有子节点 sort_value 如果是最大sort_value 就不用重排
        List<DefResource> parentList = list(Wraps.<DefResource>lbQ().eq(DefResource::getParentId, current.getParentId()).orderByAsc(DefResource::getSortValue));
        if (parentList.size() > 1 && !parentList.get(parentList.size() - 1).getId().equals(current.getId())) {
            // 删除要移除的节点
            parentList.removeIf(item -> item.getId().equals(current.getId()));
            for (int i = 0; i < parentList.size(); i++) {
                DefResource item = parentList.get(i);
                item.setSortValue(i + 1);
            }

            superManager.updateBatchById(parentList);
            allIdList.addAll(parentList.stream().map(DefResource::getId).toList());
        }

        fill(current, parent);
        if (CollUtil.isNotEmpty(childrenList)) {
            List<DefResource> tree = TreeUtil.buildTree(childrenList);
            recursiveFill(tree, current);

            superManager.updateBatchById(childrenList);
        }
        Integer sortValue = superManager.maxSortValueByParentIdAndApplicationId(current.getParentId(), current.getApplicationId());
        current.setSortValue(sortValue == null ? 1 : sortValue + 1);
        superManager.updateById(current);
        allIdList.addAll(childrenList.stream().map(DefResource::getId).toList());
        allIdList.add(current.getId());
        superManager.delCache(allIdList);
        return true;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void initTreePath() {
        List<DefResource> list = list(Wraps.<DefResource>lbQ().orderByAsc(DefResource::getSortValue));
//        根据 ApplicationId 分组
        Multimap<Long, DefResource> map = CollHelper.iterableToMultiMap(list, DefResource::getApplicationId, item -> item);
        map.asMap().forEach((k, v) -> {
            List<DefResource> tree = TreeUtil.buildTree(v);
            recursiveFill(tree, null);
        });
        for (DefResource defResource : list) {
//            fill(defResource);
//            superManager.updateById(defResource);
            cacheOps.del(ResourceResourceApiCacheKeyBuilder.builder(defResource.getId()));
        }
        superManager.updateBatchById(list);
        cacheOps.del(list.stream().map(DefResource::getId).map(ApplicationResourceCacheKeyBuilder::build).toList());


//        List<DefResourceApi> list2 = defResourceApiManager.list();
//        list2.forEach(item -> {
//                // 这里单体版和微服务版不同
//                    String uri = item.getUri();
//                    if (!StrUtil.startWithAny(uri, "/gateway")) {
//                        uri = StrUtil.subSuf(uri, StrUtil.indexOf(uri, '/', 1));
//                        uri = "/base" + uri;
//                    }
//                    item.setUri(uri);
//                });
////        List<DefResourceApi> list1 = BeanPlusUtil.toBeanList(list2, DefResourceApi.class);
//        defResourceApiManager.updateBatchById(list2);
//        cacheOps.del(AllResourceApiCacheKeyBuilder.builder());
    }


}
