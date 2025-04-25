package cn.lmx.kpu.msg.strategy.domain;

import lombok.Data;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
public class BaseProperty {
    private Boolean debug;

    public boolean initAndValid() {
        if (this.debug == null) {
            this.debug = false;
        }
        return true;
    }
}
