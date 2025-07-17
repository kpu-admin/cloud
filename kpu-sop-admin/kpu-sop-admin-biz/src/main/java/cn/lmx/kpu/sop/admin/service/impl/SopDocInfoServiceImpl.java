package cn.lmx.kpu.sop.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.common.utils.TreeUtil;
import cn.lmx.kpu.sop.admin.constants.YesOrNo;
import cn.lmx.kpu.sop.admin.dto.torna.*;
import cn.lmx.kpu.sop.admin.entity.SopDocApp;
import cn.lmx.kpu.sop.admin.enumeration.DocSourceTypeEnum;
import cn.lmx.kpu.sop.admin.manager.SopDocAppManager;
import cn.lmx.kpu.sop.admin.service.SopDocContentService;
import cn.lmx.kpu.sop.admin.service.TornaClient;
import cn.lmx.kpu.sop.admin.vo.query.SopDocInfoPageQuery;
import cn.lmx.kpu.sop.admin.vo.result.SopDocInfoResultVO;
import cn.lmx.kpu.sop.admin.vo.result.TornaDocInfoViewVO;
import cn.lmx.kpu.sop.admin.vo.update.SopDocInfoUpdateVO;
import com.alibaba.fastjson2.JSON;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.kpu.sop.admin.service.SopDocInfoService;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.admin.manager.SopDocInfoManager;
import cn.lmx.kpu.sop.admin.entity.SopDocInfo;
import org.springframework.util.CollectionUtils;

import java.io.Serializable;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * <p>
 * 业务实现类
 * 文档信息
 * </p>
 *
 * @author lmx
 * @date 2025-07-06 19:04:42
 * @create [2025-07-06 19:04:42] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopDocInfoServiceImpl extends SuperServiceImpl<SopDocInfoManager, Long, SopDocInfo> implements SopDocInfoService {
    private final SopDocAppManager sopDocAppManager;
    private final SopDocContentService sopDocContentService;
    private final TornaClient tornaClient;
    public List<SopDocInfo> listChildDoc(Long parentId) {
        return this.list(Wraps.<SopDocInfo>lbQ().eq(SopDocInfo::getParentId, parentId));
    }
    @Override
    public List<SopDocInfoResultVO> findTree(SopDocInfoPageQuery query) {
        List<SopDocInfo> list = superManager.list(Wraps.<SopDocInfo>lbQ());
        //生成树 重新写一个树形
        List<SopDocInfoResultVO> tree = BeanUtil.copyToList(list, SopDocInfoResultVO.class);

        return  TreeUtil.convertTree(tree, 0L);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void syncAppDoc(Long docAppId) {
        SopDocApp docApp = sopDocAppManager.getById(docAppId);
        this.syncDocInfo(docApp, null);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void syncDoc(Long docInfoId) {
        SopDocInfo docInfo = superManager.getById(docInfoId);
        SopDocApp docApp = sopDocAppManager.getById(docInfo.getDocAppId());
        this.syncDocInfo(docApp, docInfoId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean publish(SopDocInfoUpdateVO docInfoUpdateDTO) {
        SopDocInfo docInfo = this.getById(docInfoUpdateDTO.getId());
        Integer isPublish = docInfoUpdateDTO.getIsPublish();

        // 如果是文件夹,发布下面所有的文档
        boolean bol;
        if (YesOrNo.yes(docInfo.getIsFolder())) {
            List<SopDocInfo> children = this.listChildDoc(docInfo.getDocId());
            Set<Long> ids = children.stream().map(SopDocInfo::getId).collect(Collectors.toSet());
            bol = superManager.lambdaUpdate()
                    .in(SopDocInfo::getId, ids)
                    .set(SopDocInfo::getIsPublish, isPublish)
                    .update();
        } else {
            // 发布单个文档
            bol = superManager.lambdaUpdate()
                    .eq(SopDocInfo::getId, docInfoUpdateDTO.getId())
                    .set(SopDocInfo::getIsPublish, isPublish)
                    .update();
        }

        // 发布一个接口自动发布所属应用
        Long docAppId = docInfo.getDocAppId();
        if (YesOrNo.yes(isPublish)) {
            sopDocAppManager.lambdaUpdate()
                    .eq(SopDocApp::getId, docAppId)
                    .set(SopDocApp::getIsPublish, isPublish)
                    .update();
        } else {
            // 如果应用下的接口都未发布,应用也改成未发布
            long count = superManager.lambdaQuery()
                    .eq(SopDocInfo::getDocAppId, docAppId)
                    .eq(SopDocInfo::getIsFolder, YesOrNo.NO)
                    .eq(SopDocInfo::getIsPublish, YesOrNo.YES)
                    .count();
            if (count == 0) {
                sopDocAppManager.lambdaUpdate()
                        .eq(SopDocApp::getId, docAppId)
                        .set(SopDocApp::getIsPublish, YesOrNo.NO)
                        .update();
            }
        }

        return bol;
    }

    /**
     * 同步远程文档
     *
     * @param docApp    应用
     * @param docInfoId 同步某个文档,如果为null则同步整个应用文档
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void syncDocInfo(SopDocApp docApp, Long docInfoId) {
        Long docAppId = docApp.getId();
        Map<String, SopDocInfo> nameVersionMap = superManager.list(Wraps.<SopDocInfo>lbQ().eq(SopDocInfo::getDocAppId, docAppId))
                .stream()
                .collect(Collectors.toMap(docInfo -> docInfo.getDocName() + ":" + docInfo.getDocVersion(), Function.identity(), (v1, v2) -> v2));

        String token = docApp.getToken();
        // add doc
        DocIdsParam docIdsParam = buildSearchParam(docInfoId);
        TornaDocDTO tornaDocDTO = tornaClient.execute("doc.list", docIdsParam, token, TornaDocDTO.class);
        List<TornaDocInfoDTO> docList = tornaDocDTO.getDocList();
        if (CollectionUtils.isEmpty(docList)) {
            return;
        }

        List<SopDocInfo> updateList = new ArrayList<>();
        for (TornaDocInfoDTO tornaDocInfoDTO : docList) {
            String key = buildKey(tornaDocInfoDTO);
            SopDocInfo docInfo = nameVersionMap.get(key);
            // 需要修改的文档
            if (docInfo != null) {
                docInfo.setDocId(tornaDocInfoDTO.getId());
                docInfo.setDocTitle(tornaDocInfoDTO.getName());
                docInfo.setDocCode("");
                if (YesOrNo.yes(tornaDocInfoDTO.getIsFolder())) {
                    docInfo.setIsPublish(YesOrNo.YES);
                    docInfo.setDocName(tornaDocInfoDTO.getName());
                }
                docInfo.setDocId(tornaDocInfoDTO.getId());
                docInfo.setDocType(tornaDocInfoDTO.getType().intValue());
                docInfo.setDescription(tornaDocInfoDTO.getDescription());
                docInfo.setIsFolder(tornaDocInfoDTO.getIsFolder().intValue());
                docInfo.setParentId(tornaDocInfoDTO.getParentId());
                updateList.add(docInfo);
            }
        }
        for (SopDocInfo docInfo : updateList) {
            superManager.updateById(docInfo);
        }

        // 新增的文档
        List<SopDocInfo> saveList = docList.stream()
                .filter(tornaDocInfoDTO -> {
                    String key = buildKey(tornaDocInfoDTO);
                    return !nameVersionMap.containsKey(key);
                })
                .map(tornaDocInfoDTO -> {
                    SopDocInfo docInfo = new SopDocInfo();
                    docInfo.setDocAppId(docAppId);
                    docInfo.setDocId(tornaDocInfoDTO.getId());
                    docInfo.setDocTitle(tornaDocInfoDTO.getName());
                    docInfo.setDocCode("");
                    docInfo.setDocType(tornaDocInfoDTO.getType().intValue());
                    docInfo.setSourceType(DocSourceTypeEnum.TORNA.getValue());
                    if (YesOrNo.yes(tornaDocInfoDTO.getIsFolder())) {
                        docInfo.setIsPublish(YesOrNo.YES);
                        docInfo.setDocName(tornaDocInfoDTO.getName());
                    } else {
                        docInfo.setIsPublish(YesOrNo.NO);
                        docInfo.setDocName(tornaDocInfoDTO.getUrl());
                    }
                    docInfo.setDocVersion(tornaDocInfoDTO.getVersion());
                    docInfo.setDescription(tornaDocInfoDTO.getDescription());
                    docInfo.setIsFolder(tornaDocInfoDTO.getIsFolder().intValue());
                    docInfo.setParentId(tornaDocInfoDTO.getParentId());
                    return docInfo;
                })
                .collect(Collectors.toList());
        superManager.saveBatch(saveList);

        Set<Long> docIds = docList.stream().map(TornaDocInfoDTO::getId).collect(Collectors.toSet());
        this.syncContent(docApp, docIds);
    }

    @Override
    public TornaDocInfoViewVO getDocDetail(Long id) {
        SopDocInfo docInfo = this.getById(id);
        if (docInfo == null || !YesOrNo.yes(docInfo.getIsPublish())) {
            throw new IllegalArgumentException("文档不存在");
        }
        String content = sopDocContentService.getContent(docInfo.getId());
        return JSON.parseObject(content, TornaDocInfoViewVO.class);
    }


    private DocIdsParam buildSearchParam(Long docInfoId) {
        if (docInfoId == null) {
            return null;
        }
        DocIdsParam docIdsParam = new DocIdsParam();
        SopDocInfo docInfo = superManager.getById(docInfoId);
        List<Long> docIdList = new ArrayList<>();
        docIdList.add(docInfo.getDocId());
        // 如果是文件夹,找下面的子文档
        if (YesOrNo.yes(docInfo.getIsFolder())) {
            List<Long> docIds = this.listChildrenDocId(docInfo.getDocId());
            docIdList.addAll(docIds);
        }
        docIdsParam.setDocIds(docIdList);
        return docIdsParam;
    }
    private List<Long> listChildrenDocId(Long parentId) {
        return superManager.list(Wraps.<SopDocInfo>lbQ().eq(SopDocInfo::getParentId, parentId)).stream()
                .map(SopDocInfo::getDocId).toList();
    }

    private void syncContent(SopDocApp docApp, Set<Long> docIds) {
        List<SopDocInfo> list = superManager.lambdaQuery()
                .eq(SopDocInfo::getDocAppId, docApp.getId())
                .in(SopDocInfo::getDocId, docIds)
                .list();

        Map<Long, String> docIdMap = this.getContentMap(docApp.getToken(), docIds);
        for (SopDocInfo docInfo : list) {
            String content = docIdMap.getOrDefault(docInfo.getDocId(), "");
            sopDocContentService.saveContent(
                    docInfo.getId(),
                    content
            );
        }
    }

    /**
     * 批量获取Torna文档内容
     *
     * @param token  token
     * @param docIds Torna文档id
     * @return key:文档id, value:文档内容
     */
    private Map<Long, String> getContentMap(String token, Collection<Long> docIds) {
        // 获取torna文档信息
        List<TornaDocInfoViewDTO> tornaDocInfoViewList = tornaClient.executeList(
                "doc.details",
                new DocIdsParam(docIds),
                token,
                TornaDocInfoViewDTO.class
        );
        for (TornaDocInfoViewDTO docInfoViewDTO : tornaDocInfoViewList) {
            convertTree(docInfoViewDTO);
        }
        return tornaDocInfoViewList.stream()
                .collect(Collectors.toMap(TornaDocInfoViewDTO::getId, JSON::toJSONString, (v1, v2) -> v1));
    }
    private void convertTree(TornaDocInfoViewDTO tornaDocInfoViewDTO) {
        List<TornaDocParamDTO> requestParams = tornaDocInfoViewDTO.getRequestParams();
        List<TornaDocParamDTO> responseParams = tornaDocInfoViewDTO.getResponseParams();
        List<TornaDocParamDTO> requestTree = TreeUtil.convertTree(requestParams, 0L);
        List<TornaDocParamDTO> responseTree = TreeUtil.convertTree(responseParams, 0L);

        tornaDocInfoViewDTO.setRequestParams(requestTree);
        tornaDocInfoViewDTO.setResponseParams(responseTree);
    }
    private String buildKey(TornaDocInfoDTO tornaDocInfoDTO) {
        return YesOrNo.yes(tornaDocInfoDTO.getIsFolder()) ?
                tornaDocInfoDTO.getName() + ":" + tornaDocInfoDTO.getVersion()
                : tornaDocInfoDTO.getUrl() + ":" + tornaDocInfoDTO.getVersion();
    }

    public static List<SopDocInfo> buildTree(Collection<SopDocInfo> treeList) {
        if (CollUtil.isEmpty(treeList)) {
            return Collections.emptyList();
        }
        //记录自己是自己的父节点的id集合
        List<Serializable> selfIdEqSelfParent = new ArrayList<>();
        // 为每一个节点找到子节点集合
        for (SopDocInfo parent : treeList) {
            Serializable id = parent.getId();
            for (SopDocInfo children : treeList) {
                if (parent != children) {
                    //parent != children 这个来判断自己的孩子不允许是自己，因为有时候，根节点的parent会被设置成为自己
                    if (id.equals(children.getParentId())) {
                        parent.initChildren();
                        parent.getChildren().add(children);
                    }
                } else if (id.equals(parent.getParentId())) {
                    selfIdEqSelfParent.add(id);
                }
            }
        }
        // 找出根节点集合
        List<SopDocInfo> trees = new ArrayList<>();

        List<? extends Serializable> allIds = treeList.stream().map(SopDocInfo::getId).toList();
        for (SopDocInfo baseNode : treeList) {
            if (!allIds.contains(baseNode.getParentId()) || selfIdEqSelfParent.contains(baseNode.getParentId())) {
                trees.add(baseNode);
            }
        }
        return trees;
    }

}


