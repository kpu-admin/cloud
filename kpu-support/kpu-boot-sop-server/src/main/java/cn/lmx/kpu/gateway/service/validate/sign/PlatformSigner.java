package cn.lmx.kpu.gateway.service.validate.sign;


import cn.lmx.kpu.gateway.config.ApiConfig;
import cn.lmx.kpu.gateway.exception.ApiException;
import cn.lmx.kpu.gateway.exception.SignException;
import cn.lmx.kpu.gateway.message.ErrorEnum;
import cn.lmx.kpu.gateway.request.ApiRequest;
import cn.lmx.kpu.gateway.request.ApiRequestContext;
import cn.lmx.kpu.gateway.service.validate.Signer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * 平台签名验证实现。
 *
 * @author 六如
 * @see <a href="https://docs.open.alipay.com/291/106118">平台签名</a>
 */
@Slf4j
@Component
public class PlatformSigner implements Signer {

    @Autowired
    private ApiConfig apiConfig;

    @Override
    public boolean checkSign(ApiRequestContext apiRequestContext, String publicKey) {
        ApiRequest apiRequest = apiRequestContext.getApiRequest();
        // 服务端存的是公钥
        String charset = apiRequest.getCharset();
        String signType = apiRequest.getSignType();
        if (signType == null) {
            throw new ApiException(ErrorEnum.ISV_DECRYPTION_ERROR_MISSING_ENCRYPT_TYPE, apiRequestContext.getLocale());
        }
        if (charset == null) {
            throw new ApiException(ErrorEnum.ISV_INVALID_CHARSET, apiRequestContext.getLocale());
        }
        Map<String, String> params = buildParams(apiRequest);
        try {
            return SignUtil.rsaCheckV2(params, publicKey, charset, signType, apiConfig);
        } catch (SignException e) {
            ErrorEnum errorEnum = e.getErrorEnum();
            log.error("验签错误, code={}, subCode={}, apiRequest={}",
                    errorEnum.getCode(), errorEnum.getSubCode(), apiRequest, e);
            throw new ApiException(errorEnum, apiRequestContext.getLocale());
        } catch (Exception e) {
            log.error("验签未知错误, apiRequest={}", apiRequest, e);
            throw new ApiException(ErrorEnum.ISV_INVALID_SIGNATURE, apiRequestContext.getLocale());
        }
    }

    private Map<String, String> buildParams(ApiRequest apiRequest) {
        Map<String, String> params = new SkipNullHashMap(20);
        params.put(apiConfig.getTenantIdName(), apiRequest.getTenantId());
        params.put(apiConfig.getAppIdName(), apiRequest.getAppId());
        params.put(apiConfig.getApiName(), apiRequest.getMethod());
        params.put(apiConfig.getFormatName(), apiRequest.getFormat());
        params.put(apiConfig.getCharsetName(), apiRequest.getCharset());
        params.put(apiConfig.getSignTypeName(), apiRequest.getSignType());
        params.put(apiConfig.getSignName(), apiRequest.getSign());
        params.put(apiConfig.getTimestampName(), apiRequest.getTimestamp());
        params.put(apiConfig.getVersionName(), apiRequest.getVersion());
        params.put(apiConfig.getNotifyUrlName(), apiRequest.getNotifyUrl());
        params.put(apiConfig.getAppAuthTokenName(), apiRequest.getAppAuthToken());
        params.put(apiConfig.getBizContentName(), apiRequest.getBizContent());
        return params;
    }

    static class SkipNullHashMap extends HashMap<String, String> {
        private static final long serialVersionUID = -5660619374444097587L;

        SkipNullHashMap(int initialCapacity) {
            super(initialCapacity);
        }

        @Override
        public String put(String key, String value) {
            if (value == null) {
                return null;
            }
            return super.put(key, value);
        }
    }


}
