package cn.lmx.kpu.sop.sdk.response;

import lombok.Data;

import java.util.Date;

@Data
public class GetProductResponse {
    private Long id;
    private String name;
    private Date addTime;
}
