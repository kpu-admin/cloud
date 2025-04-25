package cn.lmx.kpu.areatest;


import cn.lmx.kpu.system.entity.system.DefArea;

import java.util.List;


public interface CityParser {

    /**
     * 解析得到省市区数据
     *
     * @param level 抓取的层级 从0开始，0-省 1-市 2-区 3-镇 4-乡
     * @return 城市
     */
    List<DefArea> parseProvinces(int level);
}
