package cn.lmx.kpu.areatest;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpUtil;
import cn.lmx.kpu.common.constant.DefValConstants;
import cn.lmx.kpu.system.entity.system.DefArea;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.baidu.fsg.uid.UidGenerator;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.nio.charset.Charset;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import static cn.lmx.basic.utils.TreeUtil.getTreePath;
import static cn.lmx.kpu.common.constant.DefValConstants.TREE_PATH_SPLIT;

/**
 * 将国家统计局的数据封装成list
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
@Slf4j
public class CityParserImpl implements CityParser {

    //    private static final String COMMON_URL = "http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2018/";
    private static final String COMMON_URL = "http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2020/";
    private static final String PROVINCE = "20";
    private static final String CITY = "30";
    private static final String COUNTY = "40";
    private static final String TOWNTR = "50";
    private static final String VLILAGERT = "60";
    private static final String SOURCE = "10";
    private static final Charset CHARSET = CharsetUtil.CHARSET_GBK;
    //    private static final Charset CHARSET = CharsetUtil.CHARSET_UTF_8;
    private static final String JSON_File = "./area_format.json";
    @Autowired
    private UidGenerator uidGenerator;


    public List<DefArea> parseProvinces(int level) {
        if (level < 0) {
            return Collections.emptyList();
        }
        // 读取 json 文件
        String json = FileUtil.readUtf8String(JSON_File);
        // 将 json 转换成字符串
        JSONArray jsonArray = JSON.parseArray(json); // JSON

        return parseProvince(jsonArray, null, level);

//        DefArea parent = new DefArea();
//        parent.setTreePath("/162118161972331434/");
//        parent.setId(162118161972331435L);
//        parent.setFullName("市辖区");
//        return parseCounty(parent, COMMON_URL + "50/5001.html", 4);
//        parent.setTreePath("/test/");
//        parent.setId(1213L);
//        parent.setFullName("test");
//        return parseCounty(parent, COMMON_URL + "41/4115.html", 4);

//        parent.setTreePath("/162118144792461765/");
//        parent.setId(162118733202981458L);
//        parent.setFullName("儋州市");
//        return parseTowntr(parent, COMMON_URL + "46/4604.html", 4);
//        parent.setTreePath("/");
//        parent.setId(162483375926411677L);
//        parent.setFullName("新疆维吾尔自治区");
//        parent.setTreePath("/");
//        return parseCity(parent, COMMON_URL + "65.html", 4);
//        parent.setId(162483375926411676L);
//        parent.setTreePath("/");
//        parent.setFullName("宁夏回族自治区");
//        return parseCity(parent, COMMON_URL + "64.html", 4);
//        parent.setId(162118733202981457L);
//        parent.setFullName("青海省");
//        parent.setTreePath("/");
//        return parseCity(parent, COMMON_URL + "64.html", 2);
    }

    /**
     * 数据结构 [{
     * "id": "11",
     * "pid": 0,
     * "deep": 0,
     * "name": "北京",
     * "pinyin": "bei jing",
     * "pinyin_prefix": "b",
     * "ext_id": "110000000000",
     * "ext_name": "北京市",
     * "childs": []
     * }]
     */
    private List<DefArea> parseProvince(JSONArray jsonArray, DefArea parent, int level) {
        if (CollUtil.isEmpty(jsonArray)) {
            return Collections.emptyList();
        }
        // 获取 class='provincetr' 的元素
        List<DefArea> list = new LinkedList<>();
        int sort = 1;
        for (Object element : jsonArray) {
            JSONObject jsonObject = (JSONObject) element;
            // 获取 elements 下属性是 href 的元素

            String name = jsonObject.getString("ext_name");
//            String fullName = jsonObject.getString("ext_name");
//                String href = link.attr("href");
            String code = jsonObject.getString("ext_id");
            String source = SOURCE;
            int currentLevel = jsonObject.getIntValue("deep");
            switch (currentLevel) {
                case 0:
                    source = PROVINCE;
                    break;
                case 1:
                    source = CITY;
                    break;
                case 2:
                    source = COUNTY;
                    break;
                case 3:
                    source = TOWNTR;
                    break;
                case 4:
                    source = VLILAGERT;
                    break;
                default:
            }
            DefArea area = DefArea.builder()
                    .id(uidGenerator.getUid())
                    .code(code).name(name)
                    .source(SOURCE).sortValue(sort++)
                    .level(source).fullName(name)
                    .treeGrade(currentLevel).treePath(TREE_PATH_SPLIT)
                    .parentId(DefValConstants.PARENT_ID)
                    .build();
            if (parent != null) {
                String parentName = parent.getFullName();
                Long parentId = parent.getId();
                String parentTreePath = parent.getTreePath();
                area.setParentId(parentId);
                area.setFullName(parentName + name);
                area.setTreeGrade(parent.getTreeGrade() + 1);
                area.setTreePath(getTreePath(parentTreePath, parentId));

            }
            if (level > currentLevel) {
                area.setChildren(parseProvince(jsonObject.getJSONArray("childs"), area, level));
            }
            switch (currentLevel) {
                case 0:
                    log.debug("省级数据:  {}  ", area);
                    break;
                case 1:
                    log.debug("市级数据:  {}  ", area);
                    break;
                case 2:
                    log.debug("县级数据:  {}  ", area);
                    break;
                case 3:
                    log.debug("镇级数据:  {}  ", area);
                    break;
                case 4:
                    log.debug("乡级数据:  {}  ", area);
                    break;
                default:
            }


            list.add(area);
        }
        return list;
    }
}
