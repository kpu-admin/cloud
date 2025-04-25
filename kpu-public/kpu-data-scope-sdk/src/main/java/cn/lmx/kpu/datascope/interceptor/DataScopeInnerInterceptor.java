package cn.lmx.kpu.datascope.interceptor;

import cn.hutool.core.collection.CollUtil;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.datascope.DataScopeHelper;
import cn.lmx.kpu.datascope.entity.DefResourceDataScope;
import cn.lmx.kpu.datascope.model.DataFieldProperty;
import cn.lmx.kpu.datascope.model.DataScopeEnum;
import cn.lmx.kpu.datascope.provider.DataScopeContext;
import cn.lmx.kpu.datascope.provider.DataScopeProvider;
import cn.lmx.kpu.datascope.service.DataScopeService;
import cn.lmx.kpu.datascope.utils.ScopeUtils;
import cn.lmx.kpu.model.enumeration.base.RoleCategoryEnum;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.ExceptionUtils;
import com.baomidou.mybatisplus.core.toolkit.PluginUtils;
import com.baomidou.mybatisplus.extension.plugins.inner.InnerInterceptor;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import net.sf.jsqlparser.expression.operators.relational.EqualsTo;
import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.expression.operators.relational.ParenthesedExpressionList;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.statement.select.*;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import org.springframework.context.annotation.Lazy;

import java.util.Collections;

/**
 * mybatis 数据权限拦截器
 * <p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
public class DataScopeInnerInterceptor implements InnerInterceptor {

    @Autowired
    @Lazy
    private DataScopeService dataScopeService;
    @Autowired
    @Lazy
    private DataScopeContext dataScopeContext;

    /**
     * 1, 请求头携带当前页面地址
     * 2，根据页面地址，查询该页面的列表权限（个人，当前部门，当前公司，自定义）
     * 3. 根据类型，查询实际过滤值
     * 4. 只拼接 where 条件
     * 企业版 拥有此插件的全部源码
     */
    @Override
    public void beforeQuery(Executor executor, MappedStatement ms, Object parameter, RowBounds rowBounds, ResultHandler resultHandler, BoundSql boundSql) {
        // 优先判断是否手动调用了 DataScopeHelper方法
        List<DataFieldProperty> dataFieldProperties = DataScopeHelper.getLocalDataScope();
        DataScopeHelper.clearDataScope();
        if (CollUtil.isEmpty(dataFieldProperties)) {
            // 解析Mapper方法上的 @DataScope 注解，并将 @DataScope 封装到 List<DataFieldProperty>
            dataFieldProperties = ScopeUtils.buildDataScopeProperty(ms.getId());
        }
        if (CollUtil.isEmpty(dataFieldProperties)) {
            return;
        }
        // 原始SQL
        String originalSql = boundSql.getSql();
        try {
            dataFieldProperties = findDataFieldProperty(dataFieldProperties);
            if (CollUtil.isEmpty(dataFieldProperties)) {
                return;
            }

            String newSql;

            Statement statement = CCJSqlParserUtil.parse(originalSql);

            // 将数据权限控制SQL动态拼接到原始SQL中
            this.processSelect((Select) statement, dataFieldProperties);

            newSql = statement.toString();

            // 拼接后的SQL替换原始SQL
            PluginUtils.MPBoundSql mpBoundSql = PluginUtils.mpBoundSql(boundSql);
            mpBoundSql.sql(newSql);
        } catch (JSQLParserException e) {
            throw ExceptionUtils.mpe("数据权限sql拼接失败, Error SQL: %s", e.getCause(), originalSql);
        } finally {
            DataScopeHelper.clearDataScope();
        }
    }

    public List<DataFieldProperty> findDataFieldProperty(List<DataFieldProperty> dataFieldProperties) {
        Long employeeId = ContextUtil.getEmployeeId();
        Long applicationId = ContextUtil.getApplicationId();
        String path = ContextUtil.getPath();
        ArgumentAssert.notEmpty(path, "请在请求头中携带访问的页面路径");
        log.info("path={}, employeeId={}, applicationId={}", path, employeeId, applicationId);
        // 1 查询员工拥有的数据权限，def_resource表的ID  （查base库）
        List<Long> resourceIdList = dataScopeService.selectDataScopeIdByEmployeeId(employeeId, RoleCategoryEnum.DATA_SCOPE.getCode());

        // 2 查询员工访问页面需要的数据权限 （查default库）
        DefResourceDataScope resourceDataScope = dataScopeService.getDataScopeByPath(applicationId, path, resourceIdList);

        // 3. 若数据权限为空，报错： 请至少配置一个默认数据权限
        if (resourceDataScope == null) {
            return Collections.emptyList();
        }

        // 4. 根据数据权限的类型，封装 DataFieldProperty
        String type = resourceDataScope.getDataScope();
        if (DataScopeEnum.CUSTOM.eq(type)) {
            type = resourceDataScope.getCustomClass();
        }

        // 5. 调用数据权限实现类 （查base库）
        DataScopeProvider dataScopeProvider = dataScopeContext.getDataScopeProvider(type);
        return dataScopeProvider.findDataFieldProperty(dataFieldProperties);
    }


    protected void processSelect(Select select, List<DataFieldProperty> dataFieldPropertyList) {
        processSelectBody(select, dataFieldPropertyList);

        // with 语句
        List<WithItem<?>> withItemsList = select.getWithItemsList();
        if (!CollectionUtils.isEmpty(withItemsList)) {
            withItemsList.forEach(withItem -> processSelectBody(withItem.getSelect(), dataFieldPropertyList));
        }
    }

    protected void processSelectBody(Select selectBody, List<DataFieldProperty> dataFieldPropertyList) {
        if (selectBody == null) {
            return;
        }
        if (selectBody instanceof PlainSelect sb) {
            // select 语句
            processPlainSelect(sb, dataFieldPropertyList);
        } else if (selectBody instanceof ParenthesedSelect ps) {
            // with 语句
            processSelectBody(ps.getSelect(), dataFieldPropertyList);
        } else if (selectBody instanceof SetOperationList operationList) {
            //  UNION 并集
            //  INTERSECT 交集
            //  EXCEPT 差集  MySQL不支持直接使用EXCEPT或MINUS操作符
            //  MINUS 差集   MySQL不支持直接使用EXCEPT或MINUS操作符
//            SetOperationList operationList = (SetOperationList) selectBody;
            List<Select> selectBodyList = operationList.getSelects();
            if (CollectionUtils.isNotEmpty(selectBodyList)) {
                selectBodyList.forEach(body -> processSelectBody(body, dataFieldPropertyList));
            }
        }
    }


    /**
     * 处理 PlainSelect
     */
    protected void processPlainSelect(PlainSelect plainSelect, List<DataFieldProperty> dataFieldPropertyList) {
        for (DataFieldProperty dsField : dataFieldPropertyList) {
            Expression where = plainSelect.getWhere();
            plainSelect.setWhere(builderExpression(where, dsField));
        }
    }


    protected Expression builderExpression(Expression currentExpression, DataFieldProperty dsField) {
        List<Long> values = dsField.getValues();

        if (values.size() > 1) {
            LongValue[] tenantIdList = values.stream().map(LongValue::new).toArray(LongValue[]::new);
            ExpressionList expressionList = new ParenthesedExpressionList<>(tenantIdList);
            InExpression inExpression = new InExpression();
            inExpression.setLeftExpression(new Column(dsField.getAliasDotField()));
            inExpression.setRightExpression(expressionList);

            if (currentExpression == null) {
                return inExpression;
            }
            if (currentExpression instanceof OrExpression) {
                return new AndExpression(new ParenthesedExpressionList<>(currentExpression), inExpression);
            } else {
                return new AndExpression(currentExpression, inExpression);
            }
        } else {
            EqualsTo equalsTo = new EqualsTo(new Column(dsField.getAliasDotField()), new LongValue(values.get(0)));

            if (currentExpression == null) {
                return equalsTo;
            }
            if (currentExpression instanceof OrExpression) {
                return new AndExpression(new ParenthesedExpressionList<>(currentExpression), equalsTo);
            } else {
                return new AndExpression(currentExpression, equalsTo);
            }
        }
    }


}

