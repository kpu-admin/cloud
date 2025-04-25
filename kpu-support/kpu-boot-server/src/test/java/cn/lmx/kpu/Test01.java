package cn.lmx.kpu;
import cn.lmx.kpu.system.service.application.DefResourceService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@SpringBootTest
@ExtendWith(SpringExtension.class)
@Slf4j
public class Test01 {
    @Autowired
    private DefResourceService defResourceService;

    @Test
    public void test01() {
        defResourceService.initTreePath();
    }

}
