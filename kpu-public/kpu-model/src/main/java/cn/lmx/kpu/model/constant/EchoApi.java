package cn.lmx.kpu.model.constant;

/**
 * Echo 注解中api的常量
 * <p>
 * 切记，该类下的接口和方法，一定要自己手动创建，否则会注入失败
 * <p>
 * 本类中的 @kpu.generator auto insert 请勿删除
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface EchoApi {
    // @kpu.generator auto insert EchoApi

    /**
     * 字典 回显实现类
     */
    String DICTIONARY_ITEM_FEIGN_CLASS = "dictFacadeImpl";
    /**
     * 组织 回显实现类
     */
    String ORG_ID_CLASS = "orgFacadeImpl";
    /**
     * 岗位 回显实现类
     */
    String POSITION_ID_CLASS = "positionFacadeImpl";
    /** 用户 回显实现类 */
    String DEF_USER_ID_CLASS = "defUserFacadeImpl";

    /** 文件 回显实现类 */
    String FILE_ID_CLASS = "fileFacadeImpl";

    String DEF_TENANT_SERVICE_IMPL_CLASS = "defTenantManagerImpl";
    String DEF_APPLICATION_SERVICE_IMPL_CLASS = "defApplicationManagerImpl";

}
