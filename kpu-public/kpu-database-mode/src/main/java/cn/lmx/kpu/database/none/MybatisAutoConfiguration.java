package cn.lmx.kpu.database.none;

import com.baomidou.mybatisplus.extension.plugins.inner.InnerInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.database.config.BaseMybatisConfiguration;
import cn.lmx.basic.database.properties.DatabaseProperties;
import cn.lmx.kpu.datascope.interceptor.DataScopeInnerInterceptor;

import java.util.List;

import static cn.lmx.kpu.common.constant.BizConstant.BUSINESS_PACKAGE;
import static cn.lmx.kpu.common.constant.BizConstant.UTIL_PACKAGE;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@Configuration
@Slf4j
@EnableConfigurationProperties({DatabaseProperties.class})
@MapperScan(basePackages = {UTIL_PACKAGE, BUSINESS_PACKAGE}, annotationClass = Repository.class)
public class MybatisAutoConfiguration extends BaseMybatisConfiguration {

    public MybatisAutoConfiguration(final DatabaseProperties databaseProperties) {
        super(databaseProperties);
    }

    /**
     * COLUMN 模式 SQL动态拼接拦截器
     *
     * @return 插件
     */
    @Override
    protected List<InnerInterceptor> getPaginationBeforeInnerInterceptor() {
        List<InnerInterceptor> list = super.getPaginationBeforeInnerInterceptor();

        Boolean isDataScope = databaseProperties.getIsDataScope();
        if (isDataScope) {
            list.add(getDataScopeInnerInterceptor());
        }
        return list;
    }


    @Bean
    public DataScopeInnerInterceptor getDataScopeInnerInterceptor() {
        return new DataScopeInnerInterceptor();
    }


}
