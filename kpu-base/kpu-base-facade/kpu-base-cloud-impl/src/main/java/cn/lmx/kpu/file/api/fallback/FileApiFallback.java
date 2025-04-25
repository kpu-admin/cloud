package cn.lmx.kpu.file.api.fallback;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.file.api.FileApi;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.vo.result.FileResultVO;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 熔断
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
public class FileApiFallback implements FileApi {
    @Override
    public R<FileResultVO> upload(MultipartFile file, String bizType, String bucket, FileStorageType storageType) {
        return R.timeout();
    }

    @Override
    public R<Map<Serializable, Object>> findUrlById(List<Long> ids) {
        return R.timeout();
    }

}
