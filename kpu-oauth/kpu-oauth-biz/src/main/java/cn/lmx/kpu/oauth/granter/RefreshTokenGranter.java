/*
 * Copyright 2002-2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package cn.lmx.kpu.oauth.granter;

import cn.dev33.satoken.config.SaTokenConfig;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.temp.SaTempUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import cn.lmx.basic.exception.BizException;
import cn.lmx.kpu.oauth.vo.result.LoginResultVO;

import static cn.lmx.basic.context.ContextConstants.JWT_KEY_COMPANY_ID;
import static cn.lmx.basic.context.ContextConstants.JWT_KEY_DEPT_ID;
import static cn.lmx.basic.context.ContextConstants.JWT_KEY_EMPLOYEE_ID;
import static cn.lmx.basic.context.ContextConstants.JWT_KEY_TOP_COMPANY_ID;
import static cn.lmx.basic.context.ContextConstants.JWT_KEY_USER_ID;

/**
 * RefreshTokenGranter
 *
 * @author Dave Syer
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
@Slf4j
public class RefreshTokenGranter {

    @Autowired
    protected SaTokenConfig saTokenConfig;

    public LoginResultVO refresh(String refreshToken) {
        // 1、验证
        Object str = SaTempUtil.parseToken(refreshToken);

        JSONObject obj = JSONUtil.parseObj(str);
        Long userId = obj.getLong(JWT_KEY_USER_ID);
        log.info("token={},obj={}", refreshToken, obj);
        if (userId == null) {
            // 刷新token过期，重新登录
            throw new BizException("回话过期，请重新登陆");
        }

        Long topCompanyId = obj.getLong(JWT_KEY_TOP_COMPANY_ID);
        Long companyId = obj.getLong(JWT_KEY_COMPANY_ID);
        Long deptId = obj.getLong(JWT_KEY_DEPT_ID);
        Long employeeId = obj.getLong(JWT_KEY_EMPLOYEE_ID);

        // 2、为其生成新的短 token
        StpUtil.login(userId, new SaLoginModel().setDevice("PC"));

        SaSession tokenSession = StpUtil.getTokenSession();
        tokenSession.setLoginId(userId);
        if (topCompanyId != null) {
            tokenSession.set(JWT_KEY_TOP_COMPANY_ID, topCompanyId);
        } else {
            tokenSession.delete(JWT_KEY_TOP_COMPANY_ID);
        }
        if (companyId != null) {
            tokenSession.set(JWT_KEY_COMPANY_ID, companyId);
        } else {
            tokenSession.delete(JWT_KEY_COMPANY_ID);
        }
        if (deptId != null) {
            tokenSession.set(JWT_KEY_DEPT_ID, deptId);
        } else {
            tokenSession.delete(JWT_KEY_DEPT_ID);
        }
        if (employeeId != null) {
            tokenSession.set(JWT_KEY_EMPLOYEE_ID, employeeId);
        } else {
            tokenSession.delete(JWT_KEY_EMPLOYEE_ID);
        }

        LoginResultVO resultVO = new LoginResultVO();
        resultVO.setToken(tokenSession.getToken());
        resultVO.setExpire(StpUtil.getTokenTimeout());
        resultVO.setRefreshToken(SaTempUtil.createToken(obj.toString(), 2 * saTokenConfig.getTimeout()));
        return resultVO;
    }

}
