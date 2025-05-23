package cn.lmx.kpu.test;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.base.entity.user.BaseEmployee;
import cn.lmx.kpu.base.service.BaseEmployeeTestService;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/baseEmployeeController")
public class BaseEmployeeTestController {

    @Autowired
    private BaseEmployeeTestService baseEmployeeTestService;


    @PostMapping("/save")
    public R<Boolean> save(@RequestBody BaseEmployee baseEmployee) {
        // 拼接
        return R.success(baseEmployeeTestService.save(baseEmployee));
    }

    @GetMapping("/getById")
    public R<BaseEmployee> getById(@RequestParam Long id) {
        // 拼接
        return R.success(baseEmployeeTestService.getById(id));
    }

    @GetMapping("/get")
    public R<BaseEmployee> get(@RequestParam Long id) {
        // 不会拼接
        return R.success(baseEmployeeTestService.get(id));
    }
}
