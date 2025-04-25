package cn.lmx.kpu.file.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.file.entity.File;
import cn.lmx.kpu.file.vo.param.FileUploadVO;
import cn.lmx.kpu.file.vo.result.FileResultVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 业务接口
 * 增量文件上传日志
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
public interface FileService extends SuperService<Long, File> {

    /**
     * 根据业务id 和 业务类型 查询附件
     * <p>
     * 返回值为： [附件, ...]
     *
     * @param bizId   业务id
     * @param bizType 业务类型
     * @return 附件
     */
    List<FileResultVO> listByBizIdAndBizType(Long bizId, String bizType);

    /**
     * 上传附件
     *
     * @param file         文件
     * @param attachmentVO 参数
     * @return 附件
     */
    FileResultVO upload(MultipartFile file, FileUploadVO attachmentVO);

    /**
     * 获取文件的临时访问链接
     *
     * @param paths 文件相对路径
     * @return
     */
    Map<String, String> findUrlByPath(List<String> paths);

    /**
     * 获取文件的临时访问链接
     *
     * @param ids 文件id
     * @return
     */
    Map<Long, String> findUrlById(List<Long> ids);

    /**
     * 下载文件
     *
     * @param request  请求头
     * @param response 响应头
     * @param ids      文件id
     * @throws Exception
     */
    void download(HttpServletRequest request, HttpServletResponse response, List<Long> ids) throws Exception;

    /**
     * 下载文件
     *
     * @param request  请求头
     * @param response 响应头
     * @param id      文件id
     * @throws Exception
     */
    void download(HttpServletRequest request, HttpServletResponse response, Long id) throws Exception;

}
