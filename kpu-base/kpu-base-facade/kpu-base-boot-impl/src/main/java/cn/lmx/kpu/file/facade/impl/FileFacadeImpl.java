package cn.lmx.kpu.file.facade.impl;


import cn.hutool.core.convert.Convert;
import cn.hutool.core.map.MapUtil;
import cn.lmx.basic.utils.CollHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.facade.FileFacade;
import cn.lmx.kpu.file.service.FileService;
import cn.lmx.kpu.file.vo.param.FileUploadVO;
import cn.lmx.kpu.file.vo.result.FileResultVO;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 文件接口
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service
@RequiredArgsConstructor
public class FileFacadeImpl implements FileFacade {
    private final FileService fileService;


    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        Map<Long, String> defMap = fileService.findUrlById(ids.stream().map(Convert::toLong).collect(Collectors.toList()));
        HashMap<Serializable, Object> map = MapUtil.newHashMap();
        map.putAll(defMap);
        return map;

    }

    @Override
    public FileResultVO upload(MultipartFile file, String bizType, String bucket, FileStorageType storageType) {
        FileUploadVO fileUploadVO = new FileUploadVO();
        fileUploadVO.setBizType(bizType);
        fileUploadVO.setBucket(bucket);
        fileUploadVO.setStorageType(storageType);
        return fileService.upload(file, fileUploadVO);
    }
}
