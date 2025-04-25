package cn.lmx.kpu.file.facade;


import cn.lmx.basic.interfaces.echo.LoadService;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.vo.result.FileResultVO;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;

/**
 * 文件接口
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
public interface FileFacade extends LoadService {

    /**
     * 根据id查询实体
     *
     * @param ids 唯一键（可能不是主键ID)
     * @return
     */
    @Override
    Map<Serializable, Object> findByIds(Set<Serializable> ids);


    /**
     * 通过feign-form 实现文件 跨服务上传
     *
     * @param file        文件
     * @param bizType     业务类型
     * @param bucket      桶
     * @param storageType 存储类型
     * @return 文件信息
     */
    FileResultVO upload(MultipartFile file, String bizType, String bucket, FileStorageType storageType);

}
