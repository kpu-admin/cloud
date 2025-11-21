package cn.lmx.kpu.msg.vo;

import cn.lmx.kpu.msg.vo.result.ExtendNoticeResultVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;

import java.io.Serializable;

/**
 * 我的消息
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
@EqualsAndHashCode
@Schema(title = "MyMsgResult", description = "我的消息")
@ToString(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyMsgResult implements Serializable {
    /** 待办 */
    private IPage<ExtendNoticeResultVO> todoList;
    /** 提醒 */
    private IPage<ExtendNoticeResultVO> noticeList;
    /** 预警 */
    private IPage<ExtendNoticeResultVO> earlyWarningList;
}
