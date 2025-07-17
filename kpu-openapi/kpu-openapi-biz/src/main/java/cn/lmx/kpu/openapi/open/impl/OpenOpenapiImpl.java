package cn.lmx.kpu.openapi.open.impl;

import cn.lmx.kpu.openapi.open.OpenOpenapi;
import cn.lmx.kpu.openapi.open.req.PayOrderSearchRequest;
import cn.lmx.kpu.openapi.open.req.PayTradeWapPayRequest;
import cn.lmx.kpu.openapi.open.req.ProductSaveRequest;
import cn.lmx.kpu.openapi.open.resp.PayOrderSearchResponse;
import cn.lmx.kpu.openapi.open.resp.PayTradeWapPayResponse;
import cn.lmx.kpu.openapi.open.resp.ProductResponse;
import com.gitee.sop.support.dto.CommonFileData;
import com.gitee.sop.support.dto.FileData;
import org.apache.commons.io.IOUtils;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.util.Assert;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;


/**
 * 开放接口实现
 *
 * @author 六如
 */
@DubboService(validation = "true")
public class OpenOpenapiImpl implements OpenOpenapi {

//    @DubboReference
//    private ProductService storyService;

    @Value("${dubbo.labels:}")
    private String env;


    @Override
    public PayTradeWapPayResponse tradeWapPay(PayTradeWapPayRequest request) {
        PayTradeWapPayResponse payTradeWapPayResponse = new PayTradeWapPayResponse();
        payTradeWapPayResponse.setPageRedirectionData(UUID.randomUUID().toString());
        return payTradeWapPayResponse;
    }

    @Override
    public PayOrderSearchResponse orderSearch(PayOrderSearchRequest request) {
        PayOrderSearchResponse payOrderSearchResponse = new PayOrderSearchResponse();
        payOrderSearchResponse.setOrderNo(request.getOrderNo());
        payOrderSearchResponse.setPayNo("xxxx");
        payOrderSearchResponse.setPayUserId(111L);
        payOrderSearchResponse.setPayUserName("Jim");

//        try {
////            ProductResult storyResult = storyService.getById(1L);
////            payOrderSearchResponse.setRemark(storyResult + ",env:" + env);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return payOrderSearchResponse;
    }
    @Override
    public ProductResponse upload(ProductSaveRequest storySaveDTO, FileData file) {
        checkFile(Arrays.asList(file));

        ProductResponse storyResponse = new ProductResponse();
        storyResponse.setId(1);
        storyResponse.setName(file.getOriginalFilename());
        return storyResponse;
    }


    @Override
    public ProductResponse upload2(ProductSaveRequest storySaveDTO, FileData idCardFront, FileData idCardBack) {
        checkFile(Arrays.asList(idCardFront, idCardBack));

        ProductResponse storyResponse = new ProductResponse();
        storyResponse.setId(1);
        storyResponse.setName(storySaveDTO.getProductName());
        return storyResponse;
    }

    @Override
    public ProductResponse upload3(ProductSaveRequest storySaveDTO, List<FileData> files) {
        List<String> list = new ArrayList<>();
        list.add("upload:" + storySaveDTO);
        checkFile(files);

        ProductResponse storyResponse = new ProductResponse();
        storyResponse.setId(1);
        storyResponse.setName(storySaveDTO.getProductName());
        return storyResponse;
    }

    @Override
    public FileData download(Integer id) {
        CommonFileData fileData = new CommonFileData();
        ClassPathResource resource = new ClassPathResource("download.txt");
        fileData.setOriginalFilename(resource.getFilename());
        try {
            fileData.setData(IOUtils.toByteArray(resource.getInputStream()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileData;
    }

    private void checkFile(List<FileData> fileDataList) {
        for (FileData file : fileDataList) {
            Assert.notNull(file.getName(), "文件名不能为空");
            Assert.notNull(file.getOriginalFilename(), "文件原始名不能为空");
            Assert.notNull(file.getBytes(), "文件数据不能为空");
            Assert.isTrue(!file.isEmpty(), "文件数据不能为空");
        }
    }
}
