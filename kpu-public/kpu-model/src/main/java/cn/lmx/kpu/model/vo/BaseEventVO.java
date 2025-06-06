package cn.lmx.kpu.model.vo;

import cn.hutool.core.collection.CollUtil;
import lombok.Data;
import lombok.experimental.Accessors;
import cn.lmx.basic.context.ContextUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@Data
@Accessors(chain = true)
public class BaseEventVO {
    private Map<String, String> map;

    /**
     * 将线程变量副 暂存到map
     * 适用于：异步调用前
     *
     * @return cn.lmx.kpu.vo.model.BaseEventVO
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    public BaseEventVO copy() {
        if (map == null) {
            map = new HashMap<>();
        }
        map.clear();
        map.putAll(ContextUtil.getLocalMap());
        return this;
    }

    /**
     * 将map写入线程变量
     * 适用于：异步执行一开始
     *
     * @return cn.lmx.kpu.vo.model.BaseEventVO
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00 ] [lmx] [初始创建]
     */
    public BaseEventVO write() {
        if (CollUtil.isNotEmpty(map)) {
            ContextUtil.setLocalMap(map);
        }
        return this;
    }

}
