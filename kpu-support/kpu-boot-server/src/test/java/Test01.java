import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.net.NetUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.system.JvmInfo;
import cn.hutool.system.OsInfo;
import cn.hutool.system.RuntimeInfo;
import cn.hutool.system.SystemUtil;
import cn.lmx.basic.utils.CommonNetWorkInfoUtil;
import com.alibaba.fastjson2.JSONObject;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.software.os.FileSystem;
import oshi.software.os.OperatingSystem;
import oshi.util.Util;

import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;
import java.math.BigDecimal;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

public class Test01 {
    @Getter
    @Setter
    public class DevMonitorServerResult {

        /* ==============概览数据============ */
        /** CPU信息 */
        @Schema(description = "CPU信息")
        private DevMonitorCpuInfo devMonitorCpuInfo;

        /** 内存信息 */
        @Schema(description = "内存信息")
        private DevMonitorMemoryInfo devMonitorMemoryInfo;

        /** 存储信息 */
        @Schema(description = "存储信息")
        private DevMonitorStorageInfo devMonitorStorageInfo;

        /** 网络信息 */
        @Schema(description = "网络信息")
        private DevMonitorNetworkInfo devMonitorNetworkInfo;

        /* ==============服务器数据============ */
        /** 服务器信息 */
        @Schema(description = "服务器信息")
        private DevMonitorServerInfo devMonitorServerInfo;

        /* ==============JVM数据============ */
        /** JVM信息 */
        @Schema(description = "JVM信息")
        private DevMonitorJvmInfo devMonitorJvmInfo;

        /**
         * CPU信息类
         *
         * @author xuyuxiang
         * @date 2022/7/31 16:42
         */
        @Getter
        @Setter
        public static class DevMonitorCpuInfo {

            /** CPU名称 */
            @Schema(description = "CPU名称")
            private String cpuName;

            /** CPU数量 */
            @Schema(description = "CPU数量")
            private String cpuNum;

            /** CPU物理核心数 */
            @Schema(description = "CPU物理核心数")
            private String cpuPhysicalCoreNum;

            /** CPU逻辑核心数 */
            @Schema(description = "CPU逻辑核心数")
            private String cpuLogicalCoreNum;

            /** CPU系统使用率 */
            @Schema(description = "CPU系统使用率")
            private String cpuSysUseRate;

            /** CPU用户使用率 */
            @Schema(description = "CPU用户使用率")
            private String cpuUserUseRate;

            /** CPU当前总使用率 */
            @Schema(description = "CPU当前总使用率")
            private Double cpuTotalUseRate;

            /** CPU当前等待率 */
            @Schema(description = "CPU当前等待率")
            private String cpuWaitRate;

            /** CPU当前空闲率 */
            @Schema(description = "CPU当前空闲率")
            private String cpuFreeRate;
        }

        /**
         * 内存信息类
         *
         * @author xuyuxiang
         * @date 2022/7/31 16:42
         */
        @Getter
        @Setter
        public static class DevMonitorMemoryInfo {

            /** 内存总量 */
            @Schema(description = "内存总量")
            private String memoryTotal;

            /** 内存已用 */
            @Schema(description = "内存已用")
            private String memoryUsed;

            /** 内存剩余 */
            @Schema(description = "内存剩余")
            private String memoryFree;

            /** 内存使用率 */
            @Schema(description = "内存使用率")
            private Double memoryUseRate;
        }

        /**
         * 存储信息
         *
         * @author xuyuxiang
         * @date 2022/7/31 16:42
         */
        @Getter
        @Setter
        public static class DevMonitorStorageInfo {

            /** 存储总量 */
            @Schema(description = "存储总量")
            private String storageTotal;

            /** 存储已用 */
            @Schema(description = "存储已用")
            private String storageUsed;

            /** 存储剩余 */
            @Schema(description = "存储剩余")
            private String storageFree;

            /** 存储使用率 */
            @Schema(description = "存储使用率")
            private Double storageUseRate;
        }

        /**
         * 网络信息类
         *
         * @author xuyuxiang
         * @date 2022/7/31 16:42
         */
        @Getter
        @Setter
        public static class DevMonitorNetworkInfo {

            /** 上行速率 */
            @Schema(description = "上行速率")
            private String upLinkRate;

            /** 下行速率 */
            @Schema(description = "下行速率")
            private String downLinkRate;

        }

        /**
         * 服务器信息类
         *
         * @author xuyuxiang
         * @date 2022/7/31 16:42
         */
        @Getter
        @Setter
        public static class DevMonitorServerInfo {

            /** 服务器名称 */
            @Schema(description = "服务器名称")
            private String serverName;

            /** 服务器操作系统 */
            @Schema(description = "服务器操作系统")
            private String serverOs;

            /** 服务器IP */
            @Schema(description = "服务器IP")
            private String serverIp;

            /** 服务器架构 */
            @Schema(description = "服务器架构")
            private String serverArchitecture;
        }

        /**
         * JVM信息类
         *
         * @author xuyuxiang
         * @date 2022/7/31 16:42
         */
        @Getter
        @Setter
        public static class DevMonitorJvmInfo {

            /** JVM名称 */
            @Schema(description = "JVM名称")
            private String jvmName;

            /** JVM版本 */
            @Schema(description = "JVM版本")
            private String jvmVersion;

            /** JVM总分配内存 */
            @Schema(description = "JVM总分配内存")
            private String jvmMemoryTotal;

            /** JVM已用内存 */
            @Schema(description = "JVM已用内存")
            private String jvmMemoryUsed;

            /** JVM剩余内存 */
            @Schema(description = "JVM剩余内存")
            private String jvmMemoryFree;

            /** JVM内存使用率 */
            @Schema(description = "JVM内存使用率")
            private Double jvmUseRate;

            /** JVM启动时间 */
            @Schema(description = "JVM启动时间")
            private String jvmStartTime;

            /** JVM运行时长 */
            @Schema(description = "JVM运行时长")
            private String jvmRunTime;

            /** Java版本 */
            @Schema(description = "Java版本")
            private String javaVersion;

            /** Java安装路径 */
            @Schema(description = "Java安装路径")
            private String javaPath;
        }
    }
    public static void main(String[] args) {
        Test01 test01 = new Test01();
        System.out.println(JSONObject.toJSONString(test01.serverInfo()));
        System.out.println(JSONObject.toJSONString(test01.networkInfo()));
    }
    public DevMonitorServerResult serverInfo() {
        DevMonitorServerResult devMonitorServerResult = new DevMonitorServerResult();
        SystemInfo si = new SystemInfo();
        HardwareAbstractionLayer hal = si.getHardware();
        CentralProcessor cpu = hal.getProcessor();

        // CPU信息
        DevMonitorServerResult.DevMonitorCpuInfo devMonitorCpuInfo = new DevMonitorServerResult.DevMonitorCpuInfo();
        devMonitorCpuInfo.setCpuName(StrUtil.trim(cpu.getProcessorIdentifier().getName()));
        devMonitorCpuInfo.setCpuNum(cpu.getPhysicalPackageCount() + "颗物理CPU");
        devMonitorCpuInfo.setCpuPhysicalCoreNum(cpu.getPhysicalProcessorCount() + "个物理核心");
        devMonitorCpuInfo.setCpuLogicalCoreNum(cpu.getLogicalProcessorCount() + "个逻辑核心");
        long[] prevTicks = cpu.getSystemCpuLoadTicks();
        Util.sleep(1000);
        long[] ticks = cpu.getSystemCpuLoadTicks();
        long nice = ticks[CentralProcessor.TickType.NICE.getIndex()]
                - prevTicks[CentralProcessor.TickType.NICE.getIndex()];
        long irq = ticks[CentralProcessor.TickType.IRQ.getIndex()]
                - prevTicks[CentralProcessor.TickType.IRQ.getIndex()];
        long softIrq = ticks[CentralProcessor.TickType.SOFTIRQ.getIndex()]
                - prevTicks[CentralProcessor.TickType.SOFTIRQ.getIndex()];
        long steal = ticks[CentralProcessor.TickType.STEAL.getIndex()]
                - prevTicks[CentralProcessor.TickType.STEAL.getIndex()];
        long sys = ticks[CentralProcessor.TickType.SYSTEM.getIndex()]
                - prevTicks[CentralProcessor.TickType.SYSTEM.getIndex()];
        long user = ticks[CentralProcessor.TickType.USER.getIndex()]
                - prevTicks[CentralProcessor.TickType.USER.getIndex()];
        long ioWait = ticks[CentralProcessor.TickType.IOWAIT.getIndex()]
                - prevTicks[CentralProcessor.TickType.IOWAIT.getIndex()];
        long idle = ticks[CentralProcessor.TickType.IDLE.getIndex()]
                - prevTicks[CentralProcessor.TickType.IDLE.getIndex()];
        long totalCpu = user + nice + sys + idle + ioWait + irq + softIrq + steal;
        devMonitorCpuInfo.setCpuSysUseRate(NumberUtil.div(NumberUtil.mul(sys, 100), totalCpu, 2) + "%");
        devMonitorCpuInfo.setCpuUserUseRate(NumberUtil.div(NumberUtil.mul(user, 100), totalCpu, 2) + "%");
        devMonitorCpuInfo.setCpuTotalUseRate(NumberUtil.div(NumberUtil.mul(NumberUtil.add(sys, user), 100), totalCpu, 2));
        devMonitorCpuInfo.setCpuWaitRate(NumberUtil.div(NumberUtil.mul(ioWait, 100), totalCpu, 2) + "%");
        devMonitorCpuInfo.setCpuFreeRate(NumberUtil.div(NumberUtil.mul(idle, 100), totalCpu, 2) + "%");
        devMonitorServerResult.setDevMonitorCpuInfo(devMonitorCpuInfo);

        // 内存信息
        GlobalMemory memory = hal.getMemory();
        DevMonitorServerResult.DevMonitorMemoryInfo devMonitorMemoryInfo = new DevMonitorServerResult.DevMonitorMemoryInfo();
        long used = memory.getTotal() - memory.getAvailable();
        devMonitorMemoryInfo.setMemoryTotal(FileUtil.readableFileSize(memory.getTotal()));
        devMonitorMemoryInfo.setMemoryUsed(FileUtil.readableFileSize(used));
        devMonitorMemoryInfo.setMemoryFree(FileUtil.readableFileSize(memory.getAvailable()));
        devMonitorMemoryInfo.setMemoryUseRate(NumberUtil.mul(NumberUtil.div(used, memory.getTotal(), 4), 100));
        devMonitorServerResult.setDevMonitorMemoryInfo(devMonitorMemoryInfo);

        // 存储信息
        DevMonitorServerResult.DevMonitorStorageInfo devMonitorStorageInfo = new DevMonitorServerResult.DevMonitorStorageInfo();
        OperatingSystem operatingSystem = si.getOperatingSystem();
        FileSystem fileSystem = operatingSystem.getFileSystem();
        AtomicLong storageTotal = new AtomicLong();
        AtomicLong storageUsed = new AtomicLong();
        AtomicLong storageFree = new AtomicLong();
        fileSystem.getFileStores().forEach(osFileStore -> {
            long totalSpace = osFileStore.getTotalSpace();
            long usableSpace = osFileStore.getUsableSpace();
            long freeSpace = osFileStore.getFreeSpace();
            long usedSpace = totalSpace - usableSpace;
            storageTotal.addAndGet(totalSpace);
            storageUsed.addAndGet(usedSpace);
            storageFree.addAndGet(freeSpace);
        });
        devMonitorStorageInfo.setStorageTotal(FileUtil.readableFileSize(storageTotal.get()));
        devMonitorStorageInfo.setStorageUsed(FileUtil.readableFileSize(storageUsed.get()));
        devMonitorStorageInfo.setStorageFree(FileUtil.readableFileSize(storageFree.get()));
        devMonitorStorageInfo.setStorageUseRate(NumberUtil.mul(NumberUtil.div(storageUsed.doubleValue(), storageTotal.doubleValue(), 4), 100));
        devMonitorServerResult.setDevMonitorStorageInfo(devMonitorStorageInfo);

        // 服务器信息
        OsInfo osInfo = SystemUtil.getOsInfo();
        DevMonitorServerResult.DevMonitorServerInfo devMonitorServerInfo = new DevMonitorServerResult.DevMonitorServerInfo();
        devMonitorServerInfo.setServerName(NetUtil.getLocalHostName());
        devMonitorServerInfo.setServerOs(osInfo.getName());
        devMonitorServerInfo.setServerIp(NetUtil.getLocalhostStr());
        devMonitorServerInfo.setServerArchitecture(osInfo.getArch());
        devMonitorServerResult.setDevMonitorServerInfo(devMonitorServerInfo);

        // JVM信息
        DevMonitorServerResult.DevMonitorJvmInfo devMonitorJvmInfo = new DevMonitorServerResult.DevMonitorJvmInfo();
        RuntimeInfo runtimeInfo = SystemUtil.getRuntimeInfo();
        JvmInfo jvmInfo = SystemUtil.getJvmInfo();
        devMonitorJvmInfo.setJvmName(jvmInfo.getName());
        devMonitorJvmInfo.setJvmVersion(jvmInfo.getVersion());
        long totalMemory = runtimeInfo.getTotalMemory();
        devMonitorJvmInfo.setJvmMemoryTotal(FileUtil.readableFileSize(totalMemory));
        devMonitorJvmInfo.setJvmMemoryFree(FileUtil.readableFileSize(runtimeInfo.getFreeMemory()));
        long jvmMemoryUsed = NumberUtil.sub(new BigDecimal(runtimeInfo
                .getTotalMemory()), new BigDecimal(runtimeInfo.getFreeMemory())).longValue();
        devMonitorJvmInfo.setJvmMemoryUsed(FileUtil.readableFileSize(jvmMemoryUsed));
        double jvmUseRate = NumberUtil.mul(NumberUtil.div(jvmMemoryUsed, totalMemory, 4), 100);
        devMonitorJvmInfo.setJvmUseRate(jvmUseRate);
        RuntimeMXBean runtimeMXBean = ManagementFactory.getRuntimeMXBean();
        DateTime startTime = DateUtil.date(runtimeMXBean.getStartTime());
        devMonitorJvmInfo.setJvmStartTime(DateUtil.formatDateTime(startTime));
        devMonitorJvmInfo.setJvmRunTime(DateUtil.formatBetween(startTime, DateTime.now()));
        devMonitorJvmInfo.setJavaVersion(SystemUtil.get("java.version", false));
        devMonitorJvmInfo.setJavaPath(SystemUtil.get("java.home", false));
        devMonitorServerResult.setDevMonitorJvmInfo(devMonitorJvmInfo);
        return devMonitorServerResult;
    }

    /**
     * 获取服务器网络情况
     *
     * @author diantu
     * @date 2023/7/27
     */
    public DevMonitorServerResult networkInfo(){
        DevMonitorServerResult devMonitorServerResult = new DevMonitorServerResult();
        // 网络信息
        DevMonitorServerResult.DevMonitorNetworkInfo devMonitorNetworkInfo = new DevMonitorServerResult.DevMonitorNetworkInfo();
        Map<String, String> networkUpRate = CommonNetWorkInfoUtil.getNetworkUpRate();
        devMonitorNetworkInfo.setUpLinkRate(networkUpRate.get("UP"));
        devMonitorNetworkInfo.setDownLinkRate(networkUpRate.get("DOWN"));
        devMonitorServerResult.setDevMonitorNetworkInfo(devMonitorNetworkInfo);
        return devMonitorServerResult;
    }

}
