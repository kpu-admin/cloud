package cn.lmx.kpu.file.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.file.entity.File;
import cn.lmx.kpu.file.vo.result.FileResultVO;

import java.util.List;

/**
 * 文件
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface FileManager extends SuperManager<File> {
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

}
