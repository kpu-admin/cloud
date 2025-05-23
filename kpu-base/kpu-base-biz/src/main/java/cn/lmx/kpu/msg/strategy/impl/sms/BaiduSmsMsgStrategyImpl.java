package cn.lmx.kpu.msg.strategy.impl.sms;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.json.JSONUtil;
import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.sms.SmsClient;
import com.baidubce.services.sms.SmsClientConfiguration;
import com.baidubce.services.sms.model.SendMessageV3Request;
import com.baidubce.services.sms.model.SendMessageV3Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.utils.StrPool;
import cn.lmx.kpu.msg.entity.DefMsgTemplate;
import cn.lmx.kpu.msg.entity.ExtendMsg;
import cn.lmx.kpu.msg.entity.ExtendMsgRecipient;
import cn.lmx.kpu.msg.strategy.MsgStrategy;
import cn.lmx.kpu.msg.strategy.domain.MsgParam;
import cn.lmx.kpu.msg.strategy.domain.MsgResult;
import cn.lmx.kpu.msg.strategy.domain.sms.BaiduSmsProperty;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 仅支持jdk7 和 jdk8，其他版本请使用API调用
 * https://cloud.baidu.com/doc/SMS/s/dkioav2od
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Service("baiduSmsMsgStrategyImpl")
public class BaiduSmsMsgStrategyImpl implements MsgStrategy {
    @Override
    public MsgResult exec(MsgParam msgParam) {
        ExtendMsg extendMsg = msgParam.getExtendMsg();
        List<ExtendMsgRecipient> recipientList = msgParam.getRecipientList();
        DefMsgTemplate extendMsgTemplate = msgParam.getExtendMsgTemplate();
        Map<String, Object> propertyParams = msgParam.getPropertyParams();

        BaiduSmsProperty property = new BaiduSmsProperty();
        BeanUtil.fillBeanWithMap(propertyParams, property, true);
        property.initAndValid();

        if (property.getDebug()) {
            SendMessageV3Response result = new SendMessageV3Response();
            result.setCode("1000");
            result.setMessage("Debug模式，无需发送！");
            return MsgResult.builder().result(result).build();
        }
        String phoneNumbers = recipientList.stream().map(ExtendMsgRecipient::getRecipient).collect(Collectors.joining(StrPool.COMMA));
        // ak、sk等config
        SmsClientConfiguration config = new SmsClientConfiguration();
        config.setCredentials(new DefaultBceCredentials(property.getAccessKeyId(), property.getSecretKey()));
        config.setEndpoint(property.getEndPoint());

        // 实例化发送客户端
        SmsClient smsClient = new SmsClient(config);
        // 若模板内容为：您的验证码是${code},在${time}分钟内输入有效

        //实例化请求对象
        SendMessageV3Request request = new SendMessageV3Request();

        Map<String, String> map = parseParam(extendMsg.getParam());

        request.setSignatureId(extendMsgTemplate.getSign());
        request.setTemplate(extendMsgTemplate.getTemplateCode());
        request.setContentVar(map);
        request.setCustom(String.valueOf(extendMsg.getId()));

        // 若 一次性发送200个手机号以上，请修改拆分后多次调用。
        request.setMobile(phoneNumbers);
        // 发送请求
        SendMessageV3Response response = smsClient.sendMessage(request);

        log.info("百度发送短信返回值={}", JSONUtil.toJsonStr(response));

        return MsgResult.builder().result(response).build();
    }

    @Override
    public boolean isSuccess(MsgResult result) {
        SendMessageV3Response sendResult = (SendMessageV3Response) result.getResult();
        return "1000".equals(sendResult.getCode());
    }
}
