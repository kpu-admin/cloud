package cn.lmx.kpu.gateway.service.dubbo;

import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.gateway.common.ApiInfoDTO;
import cn.lmx.kpu.gateway.common.enums.StatusEnum;
import cn.lmx.kpu.gateway.manager.ApiManager;
import cn.lmx.kpu.gateway.util.CopyUtil;
import cn.lmx.kpu.sop.admin.entity.SopApiInfo;
import cn.lmx.kpu.sop.admin.mapper.SopApiInfoMapper;
import com.gitee.sop.support.service.ApiRegisterService;
import com.gitee.sop.support.service.dto.RegisterDTO;
import com.gitee.sop.support.service.dto.RegisterResult;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;
import java.util.Objects;

/**
 * @author 六如
 */
@Slf4j
@DubboService
public class ApiRegisterServiceImpl implements ApiRegisterService {

    private static final int REG_SOURCE_SYS = 1;

    @Autowired
    private ApiManager apiManager;

    @Autowired
    private SopApiInfoMapper apiInfoMapper;

    @Override
    public RegisterResult register(Collection<RegisterDTO> registerDTOS) {
        try {
            for (RegisterDTO registerDTO : registerDTOS) {
                log.info("注册开放接口, registerDTO={}", registerDTO);
                this.doReg(registerDTO);
            }
            return RegisterResult.success();
        } catch (Exception e) {
            log.error("接口注册失败", e);
            return RegisterResult.error(e.getMessage());
        }
    }

    private void doReg(RegisterDTO registerDTO) {
        ApiInfoDTO apiInfoDTO = BeanPlusUtil.toBean(registerDTO, ApiInfoDTO.class);
        apiInfoDTO.setStatus(StatusEnum.ENABLE.getValue());

        SopApiInfo apiInfo = apiInfoMapper.getByNameVersion(apiInfoDTO.getApiName(), apiInfoDTO.getApiVersion());
        if (apiInfo == null) {
            apiInfo = new SopApiInfo();
        } else {
            check(apiInfo, registerDTO);
        }
        CopyUtil.copyPropertiesIgnoreNull(apiInfoDTO, apiInfo);
        apiInfo.setRegSource(REG_SOURCE_SYS);
        // 保存到数据库
        apiInfoMapper.insertOrUpdate(apiInfo);
        apiInfoDTO.setId(apiInfo.getId());
        // 保存到缓存
        apiManager.save(apiInfoDTO);
    }

    private void check(SopApiInfo apiInfo, RegisterDTO registerDTO) {
        if (!Objects.equals(apiInfo.getApplication(), registerDTO.getApplication())) {
            throw new RuntimeException("接口[" + registerDTO + "]已存在于[" + apiInfo.getApplication() + "]应用中.必须保证接口全局唯一");
        }
    }

}
