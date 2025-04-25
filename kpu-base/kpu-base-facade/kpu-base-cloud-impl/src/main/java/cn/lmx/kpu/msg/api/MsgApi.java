package cn.lmx.kpu.msg.api;


import io.swagger.v3.oas.annotations.Operation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import cn.lmx.basic.base.R;
import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.msg.vo.update.ExtendMsgSendVO;

/**
 * 文件接口
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@FeignClient(name = "${" + Constants.PROJECT_PREFIX + ".feign.base-server:kpu-base-server}")
public interface MsgApi {

    /**
     * 根据模板发送消息
     *
     * @param data 发送内容
     * @return
     */
    @Operation(summary = "根据模板发送消息", description = "根据模板发送消息")
    @PostMapping("/anyUser/extendMsg/sendByTemplate")
    R<Boolean> sendByTemplate(@RequestBody ExtendMsgSendVO data);
}
