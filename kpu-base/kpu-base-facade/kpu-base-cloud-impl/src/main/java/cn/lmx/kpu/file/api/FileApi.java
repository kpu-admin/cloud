package cn.lmx.kpu.file.api;


import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.basic.base.R;
import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.vo.result.FileResultVO;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 文件接口
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@FeignClient(name = "${" + Constants.PROJECT_PREFIX + ".feign.base-server:kpu-base-server}")
public interface FileApi {

    /**
     * 通过feign-form 实现文件 跨服务上传
     *
     * @param file        文件
     * @param bizType     业务类型
     * @param bucket      桶
     * @param storageType 存储类型
     * @return 文件信息
     */
    @PostMapping(value = "/anyone/file/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    R<FileResultVO> upload(
            @RequestPart(value = "file") MultipartFile file,
            @RequestParam(value = "bizType") String bizType,
            @RequestParam(value = "bucket", required = false) String bucket,
            @RequestParam(value = "storageType", required = false) FileStorageType storageType);
    @PostMapping(value = "/anyone/file/findUrlById", consumes = MediaType.APPLICATION_JSON_VALUE)
    R<Map<Serializable, Object>> findUrlById(@RequestBody List<Long> ids);
}
