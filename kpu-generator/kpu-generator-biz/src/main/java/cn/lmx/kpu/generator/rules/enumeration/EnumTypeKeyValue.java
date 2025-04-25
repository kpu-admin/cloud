package cn.lmx.kpu.generator.rules.enumeration;

import lombok.Data;

import java.util.List;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
public class EnumTypeKeyValue {
    private String key;
    private List<String> values;
}
