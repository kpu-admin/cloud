package cn.lmx.kpu.gateway.util;

import cn.lmx.kpu.gateway.request.ApiUploadContext;
import cn.lmx.kpu.gateway.request.UploadContext;
import com.alibaba.fastjson2.JSONObject;
import com.gitee.sop.support.context.DefaultWebContext;
import com.gitee.sop.support.context.WebContext;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URLDecoder;
import java.net.UnknownHostException;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
public class RequestUtil {
    private static final String UTF8 = "UTF-8";
    private static final String IP_UNKNOWN = "unknown";
    private static final String IP_LOCAL = "127.0.0.1";
    private static final int IP_LEN = 15;
    private static final String X_FORWARDED_FOR = "x-forwarded-for";
    private static final String PROXY_CLIENT_IP = "Proxy-Client-IP";
    private static final String PROXY_CLIENT_IP1 = "WL-Proxy-Client-IP";

    /**
     * 获取客户端IP
     *
     * @param request request
     * @return 返回ip
     */
    public static String getIP(HttpServletRequest request) {
        String ipAddress = request.getHeader(X_FORWARDED_FOR);
        if (ipAddress == null || ipAddress.isEmpty() || IP_UNKNOWN.equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader(PROXY_CLIENT_IP);
        }
        if (ipAddress == null || ipAddress.isEmpty() || IP_UNKNOWN.equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader(PROXY_CLIENT_IP1);
        }
        if (ipAddress == null || ipAddress.isEmpty() || IP_UNKNOWN.equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if (IP_LOCAL.equals(ipAddress)) {
                // 根据网卡取本机配置的IP
                try {
                    InetAddress inet = InetAddress.getLocalHost();
                    ipAddress = inet.getHostAddress();
                } catch (UnknownHostException e) {
                    // ignore
                }
            }

        }

        // 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if (ipAddress != null && ipAddress.length() > IP_LEN) {
            if (ipAddress.indexOf(",") > 0) {
                ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    /**
     * 将get类型的参数转换成JSONObject
     *
     * @param query charset=utf-8&biz_content=xxx
     * @return 返回map参数
     */
    public static JSONObject parseQuerystring(String query) {
        if (query == null) {
            return new JSONObject();
        }
        String[] queryList = StringUtils.split(query, '&');
        JSONObject params = new JSONObject();
        for (String param : queryList) {
            String[] paramArr = param.split("=");
            if (paramArr.length == 2) {
                try {
                    params.put(paramArr[0], URLDecoder.decode(paramArr[1], UTF8));
                } catch (UnsupportedEncodingException e) {
                    throw new RuntimeException(e);
                }
            } else if (paramArr.length == 1) {
                params.put(paramArr[0], "");
            }
        }
        return params;
    }

    public static JSONObject parseParameterMap(Map<String, String[]> parameterMap) {
        if (parameterMap == null || parameterMap.isEmpty()) {
            return new JSONObject();
        }
        JSONObject jsonObject = new JSONObject();
        parameterMap.forEach((key, value) -> jsonObject.put(key, value[0]));
        return jsonObject;
    }

    public static Map<String, String> getHeaders(HttpServletRequest request) {
        Enumeration<String> headerNames = request.getHeaderNames();
        Map<String, String> headers = new LinkedHashMap<>();
        if (headerNames.hasMoreElements()) {
            String name = headerNames.nextElement();
            String value = request.getHeader(name);
            headers.put(name, value);
        }
        return headers;
    }

    /**
     * 获取上传文件内容
     *
     * @param request request
     * @return 返回文件内容和表单内容
     */
    public static UploadInfo getUploadInfo(HttpServletRequest request) {
        UploadInfo uploadInfo = new UploadInfo();
        JSONObject uploadParams = new JSONObject();

        try {
            // 统一使用Spring的Multipart解析
            MultipartHttpServletRequest multipartRequest =
                    WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class);

            if (multipartRequest != null) {
                // 处理文件参数
                Map<String, List<MultipartFile>> multipartFileMap = new HashMap<>();
                multipartRequest.getFileNames().forEachRemaining(fileName -> {
                    List<MultipartFile> fileList = multipartRequest.getFiles(fileName);
                    if (!fileList.isEmpty()) {
                        multipartFileMap.put(fileName, fileList);
                    }
                });

                if (!multipartFileMap.isEmpty()) {
                    uploadInfo.setUploadContext(new ApiUploadContext(multipartFileMap));
                }

                // 处理表单参数
                Map<String, String[]> parameterMap = multipartRequest.getParameterMap();
                JSONObject finalUploadParams = uploadParams;
                parameterMap.forEach((key, values) -> {
                    if (values != null && values.length > 0) {
                        finalUploadParams.put(key, values.length == 1 ? values[0] : Arrays.asList(values));
                    }
                });
            } else {
                // 非Multipart请求，仅处理普通参数
                Map<String, String[]> parameterMap = request.getParameterMap();
                uploadParams = parseParameterMap(parameterMap);
            }

            uploadInfo.setApiParam(uploadParams);
        } catch (Exception e) {
            log.error("参数解析错误", e);
        }

        return uploadInfo;
    }

    public static UploadInfo getUploadInfo(StandardMultipartHttpServletRequest request) {
        UploadInfo uploadInfo = new UploadInfo();
        MultiValueMap<String, MultipartFile> multiFileMap = request.getMultiFileMap();
        List<MultipartFile> multipartFileList = new ArrayList<>(multiFileMap.size());
        for (String key : multiFileMap.keySet()) {
            multipartFileList.addAll(multiFileMap.get(key));
        }
        Map<String, List<MultipartFile>> multipartFileMap = multipartFileList
                .stream()
                .collect(Collectors.groupingBy(MultipartFile::getName));
        UploadContext uploadContext = new ApiUploadContext(multipartFileMap);

        JSONObject apiParam = parseParameterMap(request.getParameterMap());
        uploadInfo.setApiParam(apiParam);
        uploadInfo.setUploadContext(uploadContext);
        return uploadInfo;
    }

    public static WebContext buildWebContext(HttpServletRequest request) {
        DefaultWebContext defaultWebContext = new DefaultWebContext();
        defaultWebContext.setMethod(request.getMethod());
        defaultWebContext.setPathInfo(request.getPathInfo());
        defaultWebContext.setPathTranslated(request.getPathTranslated());
        defaultWebContext.setContextPath(request.getContextPath());
        defaultWebContext.setQueryString(request.getQueryString());
        defaultWebContext.setRequestURI(request.getRequestURI());
        defaultWebContext.setRequestURL(request.getRequestURL());
        defaultWebContext.setServletPath(request.getServletPath());
        defaultWebContext.setContentLength(request.getContentLength());
        defaultWebContext.setContentType(request.getContentType());
        defaultWebContext.setRemoteAddr(request.getRemoteAddr());
        defaultWebContext.setRemoteHost(request.getRemoteHost());
        defaultWebContext.setRemotePort(request.getRemotePort());
        defaultWebContext.setLocale(request.getLocale());
        defaultWebContext.setHeaders(RequestUtil.getHeaders(request));
        defaultWebContext.setParamtreMap(new LinkedHashMap<>(request.getParameterMap()));
        defaultWebContext.setRealIp(RequestUtil.getIP(request));
        return defaultWebContext;
    }

    @Data
    public static class UploadInfo {
        private JSONObject apiParam;
        private UploadContext uploadContext;
    }
}
