package cn.lmx.kpu.file.facade.impl;


import cn.hutool.core.convert.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.file.api.FileApi;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.facade.FileFacade;
import cn.lmx.kpu.file.vo.result.FileResultVO;

import java.io.Serializable;
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
public class FileFacadeImpl implements FileFacade {
    @Autowired
    @Lazy
    private FileApi fileApi;

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        R<Map<Serializable, Object>> result = fileApi.findUrlById(ids.stream().map(Convert::toLong).collect(Collectors.toList()));
        return result.getData();
    }

    @Override
    public FileResultVO upload(MultipartFile file, String bizType, String bucket, FileStorageType storageType) {
        R<FileResultVO> result = fileApi.upload(file, bizType, bucket, storageType);
        return result.getData();
    }

}
