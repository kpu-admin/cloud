package cn.lmx.kpu.file.strategy.impl.ali;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectRequest;
import com.aliyun.oss.model.PutObjectResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.basic.jackson.JsonUtil;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.basic.utils.StrPool;
import cn.lmx.kpu.file.domain.FileDeleteBO;
import cn.lmx.kpu.file.domain.FileGetUrlBO;
import cn.lmx.kpu.file.entity.File;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.mapper.FileMapper;
import cn.lmx.kpu.file.properties.FileServerProperties;
import cn.lmx.kpu.file.strategy.impl.AbstractFileStrategy;

import java.net.URL;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j

@Component("ALI_OSS")
public class AliFileStrategyImpl extends AbstractFileStrategy {
    public AliFileStrategyImpl(FileServerProperties fileProperties, FileMapper fileMapper) {
        super(fileProperties, fileMapper);
    }

    @Override
    protected void uploadFile(File file, MultipartFile multipartFile, String bucket) throws Exception {
        FileServerProperties.Ali ali = fileProperties.getAli();
        OSS ossClient = new OSSClientBuilder().build(ali.getEndpoint(), ali.getAccessKeyId(),
                ali.getAccessKeySecret());
        if (StrUtil.isEmpty(bucket)) {
            bucket = ali.getBucket();
        }
        if (!ossClient.doesBucketExist(bucket)) {
            ossClient.createBucket(bucket);
        }

        //生成文件名
        String uniqueFileName = getUniqueFileName(file);

        // 企业id/功能点/年/月/日/file
        String path = getPath(file.getBizType(), uniqueFileName);

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentDisposition("attachment;fileName=" + URLUtil.encode(file.getOriginalFileName()));
        metadata.setContentType(file.getContentType());
        PutObjectRequest request = new PutObjectRequest(bucket, path, multipartFile.getInputStream(), metadata);
        PutObjectResult result = ossClient.putObject(request);

        log.info("result={}", JsonUtil.toJson(result));
        // 仅当 Bucket ACL 权限支持 公共读 时，该url地址才能访问，私有权限时，需要通过 findUrl 接口获取临时访问地址
        String url = ali.getUrlPrefix() + path;
        file.setUrl(url);
        file.setUniqueFileName(uniqueFileName);
        file.setBucket(bucket);
        file.setPath(path);
        file.setStorageType(FileStorageType.ALI_OSS);

        ossClient.shutdown();
    }

    @Override
    public boolean delete(FileDeleteBO file) {
        FileServerProperties.Ali ali = fileProperties.getAli();
        String bucketName = StrUtil.isEmpty(file.getBucket()) ? ali.getBucket() : file.getBucket();
        OSS ossClient = new OSSClientBuilder().build(ali.getEndpoint(), ali.getAccessKeyId(), ali.getAccessKeySecret());
        ossClient.deleteObject(bucketName, file.getPath());
        ossClient.shutdown();
        return true;
    }

    @Override
    public Map<String, String> findUrl(List<FileGetUrlBO> fileGets) {
        OSS ossClient = createOss();
        Set<String> publicBucket = fileProperties.getPublicBucket();
        FileServerProperties.Ali ali = fileProperties.getAli();
        Map<String, String> map = new LinkedHashMap<>(CollHelper.initialCapacity(fileGets.size()));


        for (FileGetUrlBO fileGet : fileGets) {
            String bucket = StrUtil.isEmpty(fileGet.getBucket()) ? ali.getBucket() : fileGet.getBucket();
            try {
                if (CollUtil.isNotEmpty(publicBucket) && publicBucket.contains(bucket)) {
                    String url = ali.getUrlPrefix() +
                            fileGet.getBucket() +
                            StrPool.SLASH +
                            fileGet.getPath();
                    map.put(fileGet.getPath(), url);
                } else {
                    map.put(fileGet.getPath(), generatePresignedUrl(bucket, fileGet.getPath()));
                }
            } catch (Exception e) {
                log.warn("加载文件url地址失败，请确保yml中第三方存储参数配置正确. bucket={}, , 文件名={} path={}", bucket, fileGet.getOriginalFileName(), fileGet.getPath(), e);
                map.put(fileGet.getPath(), StrPool.EMPTY);
            }
        }
        ossClient.shutdown();
        return map;
    }

    /**
     * 获取一个ossclient
     *
     * @return OSS对象
     */
    public OSS createOss() {
        FileServerProperties.Ali ali = fileProperties.getAli();
        String accessKeyId = ali.getAccessKeyId();
        String accessKeySecret = ali.getAccessKeySecret();
        String endPoint = ali.getEndpoint();
        return new OSSClientBuilder().build(endPoint, accessKeyId, accessKeySecret);
    }

    /**
     * 获取有访问权限的路径地址
     *
     * @param bucketName 桶名称
     * @param path       文件路径
     * @return 访问地址
     */
    private String generatePresignedUrl(String bucketName, String path) {
        FileServerProperties.Ali ali = fileProperties.getAli();
        OSS oss = createOss();
        Date date = new Date(System.currentTimeMillis() + ali.getExpiry() * 1000);
        URL url = oss.generatePresignedUrl(bucketName, path, date);
        return url.toString();
    }
}
