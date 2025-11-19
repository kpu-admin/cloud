import cn.lmx.kpu.sdk.client.OpenClient;
import cn.lmx.kpu.sdk.common.FileResult;
import cn.lmx.kpu.sdk.common.Result;
import cn.lmx.kpu.sdk.common.UploadFile;
import cn.lmx.kpu.sdk.model.DemoFileUploadModel;
import cn.lmx.kpu.sdk.param.DemoFileUploadRequest;
import cn.lmx.kpu.sdk.param.PayTradeWapPayParam;
import cn.lmx.kpu.sdk.param.ProductDownloadRequest;
import cn.lmx.kpu.sdk.request.PayTradeWapPayRequest;
import cn.lmx.kpu.sdk.request.ProductDownloadModel;
import cn.lmx.kpu.sdk.response.GetProductResponse;
import cn.lmx.kpu.sdk.response.PayTradeWapPayResponse;
import com.alibaba.fastjson2.JSON;
import junit.framework.Assert;
import junit.framework.TestCase;
import okhttp3.Headers;
import org.apache.commons.io.IOUtils;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SdkTest extends TestCase {
    // sop-gatweay-server 的访问地址, http://ip:${server.port}/${gateway.path}
    String url = "http://localhost:18750/api";
    // 分配给第三方的 应用id
    String appId = "20250708652045476564081667";
    // 分配给第三方的 开发者私钥
    String privateKeyIsv ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDEKtOBBVzeWxo5ziqbVkWnEKs7FnNZdX5QWyy0Sdz2my2nY/bfD31A2TS9E9z0SAX9dYaA0hRt349LpVetJmu6wRDNL5J7w2vMyLJZUtrbaeTd9aFmzdJpVmqNnDiUoe05JxIc8Tre42JLLwUYk/5FTeuV0h8NvWc7fFukewJJVR+3SIjIBqm8rGZzj4gxElTrzkGTiwvSJ1aTFPj791NRDQL7sgogAm+LtYN4YhSdHolYMcFFLoe6glkVMC+End6sNLB99RJii2WtLTBxQyEpyQi69k+kUf+w8Q9lQi0kCyAxOduWJB2P7HTxxqKo6sWLh4z3M4Lbgd53Flw0hG9LAgMBAAECggEAInVDYc6HWae3G6BTa6Xj5kzPRznSWUyCO6tIVwMChW8MvfKZUuVtow6EbRIoJeDg7HzQe6BrZkF28lrA4/FzywJO6TwKByN0tCws5/Pd7dzUDwkuqNhOtaIwZV+jsLgg64EpdVwKc0yN35cK1h5o89OUJmUaf1dd4t0dW+8fn7G9FqweM1P+zQioXih3NXidmHAWgtI8Dw0OCuFbJZXfvmTePHfwkGSjO98/8b1vbekRlA1QlzdJurjl5DTrySjwIZ958aiC467AAEgzhJlVvkT4yFbwPkwJTXQd38TAmoQAYZRAAQP9aCa2U0ckdxY2OLl4YWu0Sg/8sd+uXNnPgQKBgQDKiMNu+4l/xFBkdI0ysq96eWPvwHt7hlTaGMSvbMw/RpHY7upe4nQTDZ8JESsqLVZCrHASVTI2nKSIInurtMppLEjQdO8UvdqL07CSBjXnX8cZSpIrJ62+k2VQ5cM8waDTAmRfWxC8J+jTnbBrWWhAKWm1a0y3WD9yjF05pd4g8wKBgQD388kg7VoR7jsnYbnPC9JUSTGXrMuhWJs5O4cf9DGKyLujtGdP+DyfuldTxs5IpmMPw3ErMJEFdsI6VH0ChS4o8fcA6/iMDIx6KQESIAwbMuixxF3nLCKSvS5FndvLkzxWql9S1y8rDeeOP683hyIoitziKAIQlo48Mq0IThFOSQKBgBQiQmNfCA02g9NorryyfLVNKf0kgmIGOZswySSzSR6lMkyBe7URB/745K1vEn5v4VphcAayh3pcWhLacrbgExsfduGaLkY+lWI/Ghd6HJOytsUx35QArsn6NyEyphT9HrK7UyUTlXdO9FtNGsOhMLboJwUM9KRpVm1ZvM7FSW63AoGBANFapnzFy2IOWyXiTsexvJJsBpKBVKHTtaQ6Tdo+DcKXwE712LFd8JoQ9QEIgE45JrU9mQUVia0qW85yXebN2m659otxsjdVtRrEGmJaar5gWrcWDQ9OZZauYy5mnhmiJLUsPzYr+GiK4fNqdCAXWlEPBndxvmSRKmFLjGvRtqz5AoGAWjN+Og7+/r15tYbAYTWW0ft0QNK0gky6BoLLs64E78NNVe1FeBmIJNxq6IAjcx88R2/i+nqvRuUIKr78JXeW/vdGI0BJdFbGEAaVWsA4PQU1IlEdsiaZthx4wopBRz/blDZXdrTEFBcp7Az7EKPirV1OqAIYFaSs5m9uM1HInpo=";
    // 开放平台提供的公钥:前往SOP-ADMIN，ISV管理--秘钥管理，生成平台提供的公私钥，然后把【平台公钥】放到这里
    String publicKeyPlatform = "";

    // 接口请求客户端
    OpenClient client = new OpenClient(url, appId, privateKeyIsv, publicKeyPlatform);

    /**
     * 测试 - 手机网站支付接口
     */
    public void testTradeWapPay() {
        // 请求参数
        PayTradeWapPayParam param = new PayTradeWapPayParam();

        // 业务入参
        PayTradeWapPayRequest model = new PayTradeWapPayRequest();
        model.setOutTradeNo("70501111111S001111119");
        model.setTotalAmount(new BigDecimal("1000"));
        model.setSubject("衣服");
        model.setProductCode("QUICK_WAP_WAY");
        param.setBizModel(model);
        Result<PayTradeWapPayResponse> result = client.execute(param);
        if (result.isSuccess()) {
            // 业务出参
            PayTradeWapPayResponse response = result.getData();
            System.out.println(response);
        } else {
            System.out.println(result);
        }
    }

    // 文件上传
    @Test
    public void testUpload() throws IOException {
        DemoFileUploadRequest request = new DemoFileUploadRequest();

        DemoFileUploadModel model = new DemoFileUploadModel();
        model.setProductName("上传文件参数");
        model.setAddTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        request.setBizModel(model);

        String root = System.getProperty("user.dir");
        System.out.println(root);
        // 这里演示将resources下的两个文件上传到服务器
        request.addFile(new UploadFile("idCardFront", new File(root + "/src/main/resources/file1.txt")));
        request.addFile(new UploadFile("idCardBack", new File(root + "/src/main/resources/file2.txt")));

        Result<GetProductResponse> result = client.execute(request);

        System.out.println("--------------------");
        if (result.isSuccess()) {
            GetProductResponse response = result.getData();
            System.out.println("您上传的文件信息：" + response);
        } else {
            System.out.println(JSON.toJSONString(result));
        }
        System.out.println("--------------------");
    }

    // 文件下载
    @Test
    public void testDownload() throws IOException {
        ProductDownloadRequest request = new ProductDownloadRequest();

        ProductDownloadModel model = new ProductDownloadModel();
        model.setId(111);
        request.setBizModel(model);

        FileResult result = client.download(request);
        // 文件流
        byte[] fileData = result.getFileData();
        String content = IOUtils.toString(fileData, "UTF-8");
        System.out.println("下载文件内容：" + content);
        Assert.assertEquals("abc,你好~!@#\n", content);

        System.out.println("----- header -----");
        Headers headers = result.getHeaders();
        for (String name : headers.names()) {
            String value = headers.get(name);
            System.out.println(name + ":" + value);
        }
    }

}
