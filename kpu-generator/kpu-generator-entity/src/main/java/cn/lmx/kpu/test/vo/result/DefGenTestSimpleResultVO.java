package cn.lmx.kpu.test.vo.result;

import cn.hutool.core.map.MapUtil;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import cn.lmx.basic.annotation.echo.Echo;
import cn.lmx.basic.base.entity.Entity;
import cn.lmx.basic.interfaces.echo.EchoVO;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.model.constant.EchoDictType;
import cn.lmx.kpu.test.enumeration.DefGenTestSimpleType2Enum;
import cn.lmx.kpu.test.enumeration.ProductType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Map;

/**
 * <p>
 * 表单查询方法返回值VO
 * 测试单表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
@Builder
@Schema(description = "测试单表")
public class DefGenTestSimpleResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;
    @Builder.Default
    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "ID")
    private Long id;

    /**
     * 名称
     */
    @Schema(description = "名称")
    private String name;
    /**
     * 库存
     */
    @Schema(description = "库存")
    private Integer stock;
    /**
     * 商品类型;
     * #ProductType{ordinary:普通;gift:赠品}
     */
    @Schema(description = "商品类型")
    @Echo(api = Echo.ENUM_API)
    private ProductType type;
    /**
     * 商品类型2 ;
     * <p>
     * #{ordinary:01,普通;gift:02,赠品;}
     */
    @Schema(description = "商品类型2 ")
    @Echo(api = Echo.ENUM_API)
    private DefGenTestSimpleType2Enum type2;
    /**
     * 学历;
     *
     * @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,  dictType = DictionaryType.Global.EDUCATION)
     */
    @Schema(description = "学历")
    private String type3;
    /**
     * 状态
     */
    @Schema(description = "状态")
    private Boolean state;
    /**
     * 测试
     */
    @Schema(description = "测试")
    private Integer test4;
    /**
     * 时间
     */
    @Schema(description = "时间")
    private LocalDate test5;
    /**
     * 日期
     */
    @Schema(description = "日期")
    private LocalDateTime test6;
    /**
     * 父id
     */
    @Schema(description = "父id")
    private Long parentId;
    /**
     * 名称
     */
    @Schema(description = "名称")
    private String label;
    /**
     * 排序
     */
    @Schema(description = "排序")
    private Integer sortValue;
    /**
     * 字符字典;
     *
     * @Echo(api = "cn.lmx.kpu.oauth.api.DictionaryApi", dictType="GLOBAL_SEX")
     */
    @Schema(description = "字符字典")
    @Echo(api = "cn.lmx.kpu.oauth.api.DictionaryApi", dictType = "GLOBAL_SEX")
    private String test7;
    /**
     * 整形字典;
     *
     * @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = DictionaryType.Global.DATA_TYPE)
     */
    @Schema(description = "整形字典")
    @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.DATA_TYPE)
    private Integer test12;
    /**
     * 用户;
     *
     * @Echo(api = EchoApi.POSITION_ID_CLASS)
     */
    @Schema(description = "用户")
    @Echo(api = EchoApi.POSITION_ID_CLASS)
    private Long userId;
    /**
     * 组织;
     *
     * @Echo(api = EchoApi.ORG_ID_CLASS)
     */
    @Schema(description = "组织")
    @Echo(api = EchoApi.ORG_ID_CLASS)
    private Long orgId;
    /**
     * 小数
     */
    @Schema(description = "小数")
    private BigDecimal test8;
    /**
     * 浮点2
     */
    @Schema(description = "浮点2")
    private Float test9;
    /**
     * 浮点
     */
    @Schema(description = "浮点")
    private Double test10;
    /**
     * xiao树
     */
    @Schema(description = "xiao树")
    private BigDecimal test11;


}
