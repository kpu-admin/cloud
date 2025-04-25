package cn.lmx.kpu.system.service.tenant.impl;


import cn.hutool.db.ds.DSFactory;
import cn.hutool.setting.Setting;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.basic.exception.BizException;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.system.entity.tenant.DefDatasourceConfig;
import cn.lmx.kpu.system.manager.tenant.DefDatasourceConfigManager;
import cn.lmx.kpu.system.service.tenant.DefDatasourceConfigService;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * <p>
 * 业务实现类
 * 数据源
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Service

@RequiredArgsConstructor
@Transactional(readOnly = true)
public class DefDatasourceConfigServiceImpl extends SuperServiceImpl<DefDatasourceConfigManager, Long, DefDatasourceConfig>
        implements DefDatasourceConfigService {
    @Value("${spring.datasource.druid.validation-query}")
    private String validationQuery;

    @Override
    public Boolean testConnection(Long id) {
        ArgumentAssert.notNull(id, "请先选择数据源:{}", id);
        DefDatasourceConfig defDatasourceConfig = superManager.getById(id);
        ArgumentAssert.notNull(defDatasourceConfig, "请先配置数据源:{}", id);

        String group = defDatasourceConfig.getName();
        Setting setting = Setting.create()
                .setByGroup("url", group, defDatasourceConfig.getUrl())
                .setByGroup("username", group, defDatasourceConfig.getUsername())
                .setByGroup("password", group, defDatasourceConfig.getPassword())
                .setByGroup("driver", group, defDatasourceConfig.getDriverClassName())
                .setByGroup("initialSize", group, "1")
                .setByGroup("maxActive", group, "1")
                .setByGroup("maxWait", group, "3000")
                .setByGroup("useUnfairLock", group, "true")
                .setByGroup("minIdle", group, "1")
                .setByGroup("validationQuery", group, validationQuery)
                // 链接错误重试次数
                .setByGroup("connectionErrorRetryAttempts", group, "0")
                // 获取失败后中断
                .setByGroup("breakAfterAcquireFailure", group, "true")
                // 5.7 版本支持注释
                .setByGroup("useInformationSchema", group, "true")
                .setByGroup("remarks", group, "true");

        boolean flag;
        Connection connection = null;
        DataSource dataSource;
        try (DSFactory dsFactory = DSFactory.create(setting)) {
            dataSource = dsFactory.getDataSource(group);
            connection = dataSource.getConnection();
            flag = connection != null;
        } catch (Exception e) {
            log.error("创建测试链接错误 {}", defDatasourceConfig.getUrl());
            throw new BizException("创建测试链接错误 " + defDatasourceConfig.getUrl(), e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    log.warn("关闭测试数据源链接异常", e);
                }
            }
        }
        return flag;
    }
}
