package cn.lmx.kpu.test.vo.update;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.kpu.test.enumeration.DefGenTestSimpleType2Enum;
import cn.lmx.kpu.test.enumeration.ProductType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * <p>
 * 表单修改方法VO
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
@EqualsAndHashCode
@Builder
@Schema(description = "测试单表")
public class DefGenTestSimpleUpdateVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "ID")
    @NotNull(message = "请填写ID", groups = SuperEntity.Update.class)
    private Long id;

    /**
     * 名称
     */
    @Schema(description = "名称")
    @NotEmpty(message = "请填写名称")
    @Size(max = 24, message = "名称长度不能超过{max}")
    private String name;
    /**
     * 库存
     */
    @Schema(description = "库存")
    @NotNull(message = "请填写库存")
    private Integer stock;
    /**
     * 商品类型;
     * #ProductType{ordinary:普通;gift:赠品}
     */
    @Schema(description = "商品类型")
    private ProductType type;
    /**
     * 商品类型2 ;
     * <p>
     * #{ordinary:01,普通;gift:02,赠品;}
     */
    @Schema(description = "商品类型2 ")
    private DefGenTestSimpleType2Enum type2;
    /**
     * 学历;
     *
     * @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,  dictType = DictionaryType.Global.EDUCATION)
     */
    @Schema(description = "学历")
    @Size(max = 255, message = "学历长度不能超过{max}")
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
    @Size(max = 255, message = "名称长度不能超过{max}")
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
    @Size(max = 10, message = "字符字典长度不能超过{max}")
    private String test7;
    /**
     * 整形字典;
     *
     * @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = DictionaryType.Global.DATA_TYPE)
     */
    @Schema(description = "整形字典")
    private Integer test12;
    /**
     * 用户;
     *
     * @Echo(api = EchoApi.POSITION_ID_CLASS)
     */
    @Schema(description = "用户")
    private Long userId;
    /**
     * 组织;
     *
     * @Echo(api = EchoApi.ORG_ID_CLASS)
     */
    @Schema(description = "组织")
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
