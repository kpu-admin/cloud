package cn.lmx.kpu.shu;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.lmx.basic.utils.ArgumentAssert;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.stream.Collectors;


@Slf4j
public class CustomCrawlerEnhanced {
    private final static int THREAD_COUNT = 20;
    private final static String BASE_URL = "http://www.mianhua.la/book/{}/";

    /**
     * @param bookId 书ID
     * @param bookName 书名
     * @param reverse 是否倒序
     * @param limit 爬取章节数
     * @author lmx
     * @date 2025-07-27 06:51
     * @create [2025-07-27 06:51 ] [lmx ] [初始创建]
     **/
    public static void crawl(String bookId, String bookName, boolean reverse, Integer limit) {
        ArgumentAssert.notEmpty(bookId, "请填写小说ID");
        ArgumentAssert.notEmpty(bookName, "请填写小说名称");
        if(limit != null) {
            ArgumentAssert.isTrue(limit > 0, "请填写正确的爬取数量");
        }
        String baseUrl = StrUtil.format(BASE_URL, bookId);
        ExecutorService executor = Executors.newFixedThreadPool(THREAD_COUNT);
        log.info("开始爬取小说: {}, 配置: 倒序={}, 数量={}", bookId, reverse, limit);

        try {
            // 获取章节列表
            Document doc = Jsoup.connect(baseUrl).get();
            Elements chapterLinks = doc.select("div#info").get(2).select("div.pc_list > ul > li > a");
            int totalChapters = chapterLinks.size();

            // 计算实际爬取数量
            int actualLimit = limit == null || limit > totalChapters ? totalChapters : limit;
            log.info("共发现{}章，将{}爬取{}章", totalChapters, reverse ? "倒序" : "正序", actualLimit);

            // 提交爬取任务
            List<Future<Chapter>> futures = new ArrayList<>();
            if (reverse) {
                for (int i = totalChapters - 1; i >= totalChapters - actualLimit; i--) {
                    final int originalIndex = i;
                    Element link = chapterLinks.get(i);
                    String title = link.text();
                    String url = baseUrl + link.attr("href");

                    futures.add(executor.submit(() -> {
                        log.info("正在爬取: {}", title);
                        Document contentDoc = Jsoup.connect(url).get();
                        Element contentEle = contentDoc.selectFirst("div#content1");
                        if (contentEle != null) {
                            contentEle.select("#center_tip").remove();
                        }
                        String content = null;
                        if (contentEle != null) {
                            content = contentEle.html()
                                    .replaceAll("(<br\\s*/?>\\s*)+", "\n")
                                    .replaceAll("&nbsp;", " ")
                                    .replaceAll("<.*?>", "");
                        }
                        return new Chapter(originalIndex, title, content);
                    }));
                }
            } else {
                for (int i = 0; i < actualLimit; i++) {
                    final int originalIndex = i;
                    Element link = chapterLinks.get(i);
                    String title = link.text();
                    String url = baseUrl + link.attr("href");

                    futures.add(executor.submit(() -> {
                        log.info("正在爬取: {}", title);
                        Document contentDoc = Jsoup.connect(url).get();
                        Element contentEle = contentDoc.selectFirst("div#content1");
                        if (contentEle != null) {
                            contentEle.select("#center_tip").remove();
                        }
                        String content = null;
                        if (contentEle != null) {
                            content = contentEle.html()
                                    .replaceAll("(<br\\s*/?>\\s*)+", "\n")
                                    .replaceAll("&nbsp;", " ")
                                    .replaceAll("<.*?>", "");
                        }
                        return new Chapter(originalIndex, title, content);
                    }));
                }
            }

            // 收集结果并排序
            List<Chapter> chapters = new ArrayList<>();
            for (Future<Chapter> f : futures) {
                chapters.add(f.get());
            }
            chapters.stream().filter(c -> StrUtil.isBlank(
                    c.getContent())).forEach(c -> log.warn("爬取失败或者该章节没有内容：{}", c.getTitle()));
            chapters = chapters.stream().filter(c -> StrUtil.isNotBlank(
                    c.getContent())).collect(Collectors.toList());
            if (CollUtil.isEmpty(chapters)) {
                log.error("所有章节爬取失败或者章节没有内容");
                return;
            }
            chapters.sort(Comparator.comparingInt(Chapter::getIndex));
            log.info("所有章节爬取完成，共{}章，开始写入文件", chapters.size());
            // 生成输出文件名
            String outputFileName;
            if (limit != null) {
                outputFileName = StrUtil.format("{}_{}{}章.txt", bookName, reverse ? "最新" : "前", limit);
            } else {
                outputFileName = StrUtil.format("{}.txt", bookName);
            }
            // 写入文件
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(outputFileName))) {
                for (int i = 0; i < chapters.size(); i++) {
                    Chapter c = chapters.get(i);
                    bw.write("【" + c.title + "】\n");
                    bw.write(c.content);

                    if (i < chapters.size() - 1) {
                        bw.newLine();
                    }
                }
                File file = new File(outputFileName);
                log.info("文件写入成功: {}", file.getAbsolutePath());
            }

        } catch (Exception e) {
            log.error("爬取过程中发生异常: {}", e.getMessage(), e);
        } finally {
            executor.shutdown();
            log.info("线程池已关闭");
        }
    }

    /**
     * @param bookId 书ID
     * @param bookName 书名
     * @author lmx
     * @date 2025-07-27 06:51
     * @create [2025-07-27 06:51 ] [lmx ] [初始创建]
     **/
    public static void crawl(String bookId, String bookName) {
        crawl(bookId, bookName, false, null);
    }

    /**
     *
     * @param bookId 书ID
     * @param bookName 书名
     * @param limit 爬取章节数
     * @author lmx
     * @date 2025-07-27 06:51
     * @create [2025-07-27 06:51 ] [lmx ] [初始创建]
     **/
    public static void crawl(String bookId, String bookName, int limit) {
        crawl(bookId, bookName, false, limit);
    }

    /**
     *
     * @param bookId 书ID
     * @param bookName 书名
     * @param limit 爬取章节数
     * @author lmx
     * @date 2025-07-27 06:52
     * @create [2025-07-27 06:52 ] [lmx ] [初始创建]
     **/
    public static void crawlReverse(String bookId, String bookName, int limit) {
        crawl(bookId, bookName, true, limit);
    }

    public static void main(String[] args) {
//        crawlReverse("34840", "大明：寒门辅臣", 1);
//        crawl("44505", "秦吏", 10);
        crawl("44505", "秦吏");
    }
    @Data
    static class Chapter {
        int index;
        String title;
        String content;

        Chapter(int index, String title, String content) {
            this.index = index;
            this.title = title;
            this.content = content;
        }
    }
}