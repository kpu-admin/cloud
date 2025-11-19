package cn.lmx.kpu.sdk.param;

import cn.lmx.kpu.sdk.common.OpenConfig;
import cn.lmx.kpu.sdk.common.RequestForm;
import cn.lmx.kpu.sdk.common.RequestMethod;
import cn.lmx.kpu.sdk.common.UploadFile;
import cn.lmx.kpu.sdk.util.ClassUtil;
import com.alibaba.fastjson2.JSON;

import java.text.SimpleDateFormat;
import java.util.*;

public abstract class BaseParam<Req, Resp> {

    private static final String EMPTY_JSON = "{}";

    private String method;
    private String version;

    private String bizContent = EMPTY_JSON;
    private Object bizModel;

    private RequestMethod requestMethod = RequestMethod.POST;

    /**
     * 上传文件
     */
    private List<UploadFile> files;

    private Class<Resp> responseClass = parseResponseClass();

    protected Class<Resp> parseResponseClass() {
        return (Class<Resp>) ClassUtil.getSuperClassGenricType(this.getClass(), 1);
    }

    /**
     * 定义接口名称
     * @return 接口名称
     */
    protected abstract String method();

    public BaseParam() {
        this.method = method();
        this.version = version();
    }

    protected BaseParam(String method, String version) {
        this.method = method;
        this.version = version;
    }

    protected String version() {
        return version;
    }

    /**
     * 添加上传文件
     *
     * @param file
     */
    public void addFile(UploadFile file) {
        if (this.files == null) {
            this.files = new ArrayList<>();
        }
        this.files.add(file);
    }

    public RequestForm createRequestForm(OpenConfig openConfig) {
        // 公共请求参数
        Map<String, String> params = new HashMap<String, String>(16);
        params.put(openConfig.getMethodName(), this.method);
        params.put(openConfig.getFormatName(), openConfig.getFormatType());
        params.put(openConfig.getCharsetName(), openConfig.getCharset());
        params.put(openConfig.getSignTypeName(), openConfig.getSignType());
        String timestamp = new SimpleDateFormat(openConfig.getTimestampPattern()).format(new Date());
        params.put(openConfig.getTimestampName(), timestamp);
        String v = this.version == null ? openConfig.getDefaultVersion() : this.version;
        params.put(openConfig.getVersionName(), v);

        // 业务参数
        String bizContents = buildBizContent();

        params.put(openConfig.getDataName(), bizContents);

        RequestForm requestForm = new RequestForm(params);
        requestForm.setRequestMethod(getRequestMethod());
        requestForm.setCharset(openConfig.getCharset());
        requestForm.setFiles(this.files);
        return requestForm;
    }

    protected String buildBizContent() {
        if (bizModel != null) {
            return JSON.toJSONString(bizModel);
        } else {
            return this.bizContent;
        }
    }

    public String getMethod() {
        return method;
    }

    /**
     * 指定版本号
     *
     * @param version
     */
    public void setVersion(String version) {
        this.version = version;
    }

    public void setBizContent(String bizContent) {
        this.bizContent = bizContent;
    }

    public void setBizModel(Object bizModel) {
        this.bizModel = bizModel;
    }

    public void setFiles(List<UploadFile> files) {
        this.files = files;
    }

    public Class<Resp> getResponseClass() {
        return responseClass;
    }


    public RequestMethod getRequestMethod() {
        return requestMethod;
    }

    public void setRequestMethod(RequestMethod requestMethod) {
        this.requestMethod = requestMethod;
    }
}
