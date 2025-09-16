package cn.lmx.kpu.shop.vo.result.oauth;


import cn.hutool.core.map.MapUtil;
import cn.lmx.basic.annotation.echo.Echo;
import cn.lmx.basic.base.entity.Entity;
import cn.lmx.basic.interfaces.echo.EchoVO;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.model.constant.EchoDictType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Map;


/**
 * <p>
 * 实体类
 * 用户
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = false)
@Builder
@Schema(description = "用户")
public class MemberUserInfoResultVO extends Entity<Long> implements Serializable, EchoVO {

    private static final long serialVersionUID = 1L;
    @Builder.Default
    private Map<String, Object> echoMap = MapUtil.newHashMap();

    @Schema(description = "主键")
    private Long id;

    /**
     * 用户名;大小写数字下划线
     */
    @Schema(description = "用户名")
    
    private String username;
    /**
     * 昵称
     */
    @Schema(description = "昵称")
    
    private String nickName;
    /**
     * 手机;1开头11位纯数字
     */
    @Schema(description = "手机")
    
    private String mobile;
    /**
     * 身份证;15或18位
     */
    @Schema(description = "身份证")
    
    private String idCard;
    /**
     * 微信OpenId
     */
    @Schema(description = "微信OpenId")
    private String wxOpenId;

    /**
     * 用户余额
     */
    @Schema(description = "用户余额")
    private BigDecimal nowMoney;

    /**
     * 用户剩余积分
     */
    @Schema(description = "用户剩余积分")
    private BigDecimal integral;

    /**
     * 等级
     */
    @Schema(description = "等级")
    private Integer level;

    /**
     * 内置;[0-否 1-是]
     */
    @Schema(description = "内置")
    
    private Boolean readonly;
    /**
     * 性别;
     * #Sex{W:女;M:男;N:未知}
     */
    @Schema(description = "性别")
    
    @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.SEX)
    private String sex;
    /**
     * 民族;[01-汉族 99-其他]	@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.NATION)
     */
    @Schema(description = "民族")
    @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.NATION)
    
    private String nation;
    /**
     * 学历;[01-小学 02-中学 03-高中 04-专科 05-本科 06-硕士 07-博士 08-博士后 99-其他]	@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.EDUCATION)
     */
    @Schema(description = "学历")
    @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.EDUCATION)
    
    private String education;
    /**
     * 状态;[0-禁用 1-启用]
     */
    @Schema(description = "状态")
    
    private Boolean state;

    @Schema(description = "头像id")
    @Echo(api = EchoApi.FILE_ID_CLASS, ref = "avatar")
    private Long avatarId;

    @Schema(description = "头像")
    private String avatar;

    /**
     * 工作描述
     */
    @Schema(description = "工作描述")
    
    private String workDescribe;

    /** 为空时，默认页面由前端控制 */
    @Schema(description = "登录成功后，跳转的页面")
    private String homePath;
}
