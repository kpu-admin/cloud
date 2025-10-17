package cn.lmx.kpu.shop.manager.user.impl;

import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.cache.redis2.CacheResult;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.shop.user.MemberUserCacheKeyBuilder;
import cn.lmx.kpu.common.cache.shop.user.MemberUserMobileCacheKeyBuilder;
import cn.lmx.kpu.common.cache.shop.user.MemberUserUserNameCacheKeyBuilder;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.shop.manager.user.MemberUserManager;
import cn.lmx.kpu.shop.mapper.user.MemberUserMapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * <p>
 * 通用业务实现类
 * 商城用户
 * </p>
 *
 * @author lmx
 * @date 2025-08-18 23:30:25
 * @create [2025-08-18 23:30:25] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class MemberUserManagerImpl extends SuperCacheManagerImpl<MemberUserMapper, MemberUser> implements MemberUserManager {

    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new MemberUserCacheKeyBuilder();
    }
    @Override
    public int resetPassErrorNum(Long id) {
        return baseMapper.resetPassErrorNum(id, LocalDateTime.now());
    }

    @Override
    public void incrPasswordErrorNumById(Long id) {
        baseMapper.incrPasswordErrorNumById(id, LocalDateTime.now());
    }

    private MemberUser getMemberUser(CacheKey key, String value, SFunction<MemberUser, ?> fun) {
        CacheResult<Long> result = cacheOps.get(key, k -> {
            MemberUser memberUser = getOne(Wrappers.<MemberUser>lambdaQuery().eq(fun, value), false);
            return memberUser != null ? memberUser.getId() : null;
        });
        return getByIdCache(result.getValue());
    }

    @Override
    public MemberUser getUserByUsername(String username) {
        CacheKey key = MemberUserUserNameCacheKeyBuilder.builder(username);
        return getMemberUser(key, username, MemberUser::getUsername);
    }

    @Override
    public MemberUser getUserByMobile(String mobile) {
        CacheKey key = MemberUserMobileCacheKeyBuilder.builder(mobile);
        return getMemberUser(key, mobile, MemberUser::getMobile);
    }

}


