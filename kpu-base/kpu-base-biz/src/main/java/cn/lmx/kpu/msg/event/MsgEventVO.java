package cn.lmx.kpu.msg.event;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import cn.lmx.kpu.model.vo.BaseEventVO;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@Data
@EqualsAndHashCode(callSuper=false)
@Accessors(chain = true)
public class MsgEventVO extends BaseEventVO {
    Long msgId;
}
