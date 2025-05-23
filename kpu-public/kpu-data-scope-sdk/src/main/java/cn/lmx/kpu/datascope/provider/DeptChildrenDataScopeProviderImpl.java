package cn.lmx.kpu.datascope.provider;

import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.kpu.datascope.model.DataFieldProperty;
import cn.lmx.kpu.datascope.service.OrgHelperService;

import java.util.Collections;
import java.util.List;

/**
 * 本部门及子级
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@RequiredArgsConstructor
@Component("DATA_SCOPE_04")
public class DeptChildrenDataScopeProviderImpl implements DataScopeProvider {
    @Autowired
    private OrgHelperService orgHelperService;

    @Override
    public List<DataFieldProperty> findDataFieldProperty(List<DataFieldProperty> fsp) {
        List<Long> orgIdList = orgHelperService.findDeptAndChildrenIdByEmployeeId(ContextUtil.getEmployeeId());
        if (CollUtil.isEmpty(orgIdList)) {
            return Collections.emptyList();
        }
        fsp.forEach(item -> {
            item.setField(SuperEntity.CREATED_ORG_ID_FIELD);
            item.setValues(orgIdList);
        });
        return fsp;
    }
}
