package cn.lmx.kpu.file.manager.impl;

import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.file.entity.File;
import cn.lmx.kpu.file.manager.FileManager;
import cn.lmx.kpu.file.mapper.FileMapper;
import cn.lmx.kpu.file.vo.result.FileResultVO;

import java.util.List;

/**
 * 文件
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Service
public class FileManagerImpl extends SuperManagerImpl<FileMapper, File> implements FileManager {
    @Override
    public List<FileResultVO> listByBizIdAndBizType(Long bizId, String bizType) {
        return baseMapper.listByBizIdAndBizType(bizId, bizType);
    }
}
