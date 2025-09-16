package cn.lmx.kpu.shu;

import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpUtil;
import cn.lmx.basic.utils.ArgumentAssert;
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


@Slf4j
public class CrawlerEnhanced2 {
    private final static int THREAD_COUNT = 2;
    private final static String BASE_URL = "https://www.123yqw.com/3/{}/";
    private final  String htmlStr = "";
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
//            Document doc = Jsoup.connect(baseUrl).get();
            // 读取 html.txt 文件
            File htmlFile = new File("/Users/lmx/Documents/IdeaProjects/kpu-cloud/kpu-support/kpu-boot-server/src/test/java/cn/lmx/kpu/shu/html.txt");
            Document doc = Jsoup.parse(htmlFile, "UTF-8");
            Elements chapterLinks = doc.select("#chapters_list_desc > dd > a");
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
                    String url =  "https://www.myhuayuan.cc"+link.attr("href");

                    futures.add(executor.submit(() -> {
                        log.info("正在爬取: {}", title);
                        HttpRequest get = HttpUtil.createGet(url);
                        byte[] bytes = get.charset(CharsetUtil.CHARSET_UTF_8).execute().bodyBytes();
                        log.info("获取请求成功: {}", title);
                        String htmlStr = HttpUtil.getString(bytes, CharsetUtil.CHARSET_UTF_8, false);
                        Document contentDoc = Jsoup.parse(htmlStr);
                        Element contentEle = contentDoc.selectFirst("#article");
                        if (contentEle != null) {
                            contentEle.select("script").remove();
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
                    String url =  "https:"+link.attr("href");

                    futures.add(executor.submit(() -> {
                        log.info("正在爬取: {}", title);
                        Document contentDoc = Jsoup.connect(url).get();
                        Element contentEle = contentDoc.selectFirst("#content");
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
                        log.info("爬取完成: {}", title);
                        return new Chapter(originalIndex, title, content);
                    }));
                }
            }

            // 收集结果并排序
            List<Chapter> chapters = new ArrayList<>();
            for (Future<Chapter> f : futures) {
                chapters.add(f.get());
            }
            chapters.sort(Comparator.comparingInt(c -> c.index));
            log.info("所有章节爬取完成，共{}章，开始写入文件", chapters.size());
            // 生成输出文件名
            String outputFileName;
            if (limit != null) {
                outputFileName = StrUtil.format("{}_{}{}章.txt", bookName, !reverse ? "前" : "最新", limit);
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
        crawlReverse("3366", "逍遥四公子", 10);
//        crawl("3366", "逍遥四公子", 1);
//        crawl("3366", "逍遥四公子");
    }

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