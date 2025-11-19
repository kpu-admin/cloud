package cn.lmx.kpu.sdk.common;

/**
 * @author 六如
 */
public enum SopSdkErrors {
    /**
     * 网络错误
     */
    HTTP_ERROR("836875001", "网络错误"),
    /**
     * 验证返回sign错误
     */
    CHECK_RESPONSE_SIGN_ERROR("836875002", "验证服务端sign出错");

    private String code;
    private String msg;
    private String subCode;
    private String subMsg;
    SopSdkErrors(String code, String msg) {
        this.code = code;
        this.msg = msg;
        this.subCode = code;
        this.subMsg = msg;
    }

    public Result getErrorResult() {
        Result result = new Result();
        result.setCode(code);
        result.setSubCode(subCode);
        result.setSubMsg(subMsg);
        result.setMsg(msg);
        return result;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public String getSubCode() {
        return subCode;
    }

    public String getSubMsg() {
        return subMsg;
    }

}
