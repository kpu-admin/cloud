package cn.lmx.kpu.sop.sdk;

import cn.lmx.kpu.sop.sdk.client.OpenClient;
import cn.lmx.kpu.sop.sdk.common.FileResult;
import cn.lmx.kpu.sop.sdk.common.Result;
import cn.lmx.kpu.sop.sdk.common.UploadFile;
import cn.lmx.kpu.sop.sdk.model.DemoFileUploadModel;
import cn.lmx.kpu.sop.sdk.model.GetStoryModel;
import cn.lmx.kpu.sop.sdk.request.*;
import cn.lmx.kpu.sop.sdk.response.GetProductResponse;
import cn.lmx.kpu.sop.sdk.response.PayTradeWapPayResponse;
import com.alibaba.fastjson2.JSON;
import junit.framework.TestCase;
import okhttp3.Headers;
import org.apache.commons.io.IOUtils;
import org.junit.Assert;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;


public class SdkTest extends TestCase {
    String url = "http://localhost:8081/api";
    String appId = "2019032617262200001";
    /**
     * 开发者私钥
     */
    String privateKeyIsv = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCXJv1pQFqWNA/++OYEV7WYXwexZK/J8LY1OWlP9X0T6wHFOvxNKRvMkJ5544SbgsJpVcvRDPrcxmhPbi/sAhdO4x2PiPKIz9Yni2OtYCCeaiE056B+e1O2jXoLeXbfi9fPivJZkxH/tb4xfLkH3bA8ZAQnQsoXA0SguykMRZntF0TndUfvDrLqwhlR8r5iRdZLB6F8o8qXH6UPDfNEnf/K8wX5T4EB1b8x8QJ7Ua4GcIUqeUxGHdQpzNbJdaQvoi06lgccmL+PHzminkFYON7alj1CjDN833j7QMHdPtS9l7B67fOU/p2LAAkPMtoVBfxQt9aFj7B8rEhGCz02iJIBAgMBAAECggEARqOuIpY0v6WtJBfmR3lGIOOokLrhfJrGTLF8CiZMQha+SRJ7/wOLPlsH9SbjPlopyViTXCuYwbzn2tdABigkBHYXxpDV6CJZjzmRZ+FY3S/0POlTFElGojYUJ3CooWiVfyUMhdg5vSuOq0oCny53woFrf32zPHYGiKdvU5Djku1onbDU0Lw8w+5tguuEZ76kZ/lUcccGy5978FFmYpzY/65RHCpvLiLqYyWTtaNT1aQ/9pw4jX9HO9NfdJ9gYFK8r/2f36ZE4hxluAfeOXQfRC/WhPmiw/ReUhxPznG/WgKaa/OaRtAx3inbQ+JuCND7uuKeRe4osP2jLPHPP6AUwQKBgQDUNu3BkLoKaimjGOjCTAwtp71g1oo+k5/uEInAo7lyEwpV0EuUMwLA/HCqUgR4K9pyYV+Oyb8d6f0+Hz0BMD92I2pqlXrD7xV2WzDvyXM3s63NvorRooKcyfd9i6ccMjAyTR2qfLkxv0hlbBbsPHz4BbU63xhTJp3Ghi0/ey/1HQKBgQC2VsgqC6ykfSidZUNLmQZe3J0p/Qf9VLkfrQ+xaHapOs6AzDU2H2osuysqXTLJHsGfrwVaTs00ER2z8ljTJPBUtNtOLrwNRlvgdnzyVAKHfOgDBGwJgiwpeE9voB1oAV/mXqSaUWNnuwlOIhvQEBwekqNyWvhLqC7nCAIhj3yvNQKBgQCqYbeec56LAhWP903Zwcj9VvG7sESqXUhIkUqoOkuIBTWFFIm54QLTA1tJxDQGb98heoCIWf5x/A3xNI98RsqNBX5JON6qNWjb7/dobitti3t99v/ptDp9u8JTMC7penoryLKK0Ty3bkan95Kn9SC42YxaSghzqkt+uvfVQgiNGQKBgGxU6P2aDAt6VNwWosHSe+d2WWXt8IZBhO9d6dn0f7ORvcjmCqNKTNGgrkewMZEuVcliueJquR47IROdY8qmwqcBAN7Vg2K7r7CPlTKAWTRYMJxCT1Hi5gwJb+CZF3+IeYqsJk2NF2s0w5WJTE70k1BSvQsfIzAIDz2yE1oPHvwVAoGAA6e+xQkVH4fMEph55RJIZ5goI4Y76BSvt2N5OKZKd4HtaV+eIhM3SDsVYRLIm9ZquJHMiZQGyUGnsvrKL6AAVNK7eQZCRDk9KQz+0GKOGqku0nOZjUbAu6A2/vtXAaAuFSFx1rUQVVjFulLexkXR3KcztL1Qu2k5pB6Si0K/uwQ=";
    /**
     * 开放平台提供的公钥
     * 前往SOP-ADMIN，ISV管理--秘钥管理，生成平台提供的公私钥，然后把【平台公钥】放到这里
     */
    String publicKeyPlatform = "";

    // 声明一个就行
    OpenClient client = new OpenClient(url, appId, privateKeyIsv, publicKeyPlatform);

    @Test
    public void test() {
        PayTradeWapPayRequest request = new PayTradeWapPayRequest();
        PayTradeWapPayModel model = new PayTradeWapPayModel();
        model.setOutTradeNo("70501111111S001111119");
        model.setTotalAmount(new BigDecimal("1000"));
        model.setSubject("衣服");
        model.setProductCode("QUICK_WAP_WAY");
        request.setBizModel(model);

        Result<PayTradeWapPayResponse> result = client.execute(request);
        if (result.isSuccess()) {
            PayTradeWapPayResponse response = result.getData();
            System.out.println(response);
        } else {
            System.out.println(result);
        }
    }

    @Test
    public void testGet() {
        // 创建请求对象
        GetProductRequest request = new GetProductRequest();
        // 请求参数
        GetStoryModel model = new GetStoryModel();
        model.setId(1);
        request.setBizModel(model);

        // 发送请求
        Result<GetProductResponse> result = client.execute(request);

        if (result.isSuccess()) {
            GetProductResponse response = result.getData();
            // 返回结果
            System.out.println(String.format("response:%s",
                    JSON.toJSONString(response)));
        } else {
            System.out.println("错误，subCode:" + result.getSubCode() + ", subMsg:" + result.getSubMsg());
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
