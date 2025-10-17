package cn.lmx.kpu.shop.service.user.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import cn.lmx.basic.base.service.impl.SuperCacheServiceImpl;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.common.cache.shop.user.MemberUserMobileCacheKeyBuilder;
import cn.lmx.kpu.common.constant.AppendixType;
import cn.lmx.kpu.file.service.AppendixService;
import cn.lmx.kpu.model.vo.save.AppendixSaveVO;
import cn.lmx.kpu.shop.entity.user.MemberUser;
import cn.lmx.kpu.shop.manager.user.MemberUserManager;
import cn.lmx.kpu.shop.service.user.MemberUserService;
import cn.lmx.kpu.system.vo.update.tenant.DefUserAvatarUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserBaseInfoUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserMobileUpdateVO;
import cn.lmx.kpu.system.vo.update.tenant.DefUserPasswordUpdateVO;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 业务实现类
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
@Transactional(readOnly = true)
public class MemberUserServiceImpl extends SuperCacheServiceImpl<MemberUserManager, Long, MemberUser> implements MemberUserService {
    private final AppendixService appendixService;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String register(MemberUser memberUser) {
        ArgumentAssert.isFalse(checkMobile(memberUser.getMobile(), null), "手机号：{}已经存在", memberUser.getMobile());
        setMemberUser(memberUser);
        memberUser.setNickName(memberUser.getMobile());

        superManager.save(memberUser);
        CacheKey key = MemberUserMobileCacheKeyBuilder.builder(memberUser.getMobile());
        cacheOps.del(key);
        return memberUser.getMobile();
    }

    private void setMemberUser(MemberUser memberUser) {
        memberUser.setSalt(RandomUtil.randomString(20));
        memberUser.setPassword(SecureUtil.sha256(memberUser.getPassword() + memberUser.getSalt()));
        memberUser.setPasswordErrorNum(0);
//        memberUser.setReadonly(false);
        memberUser.setState(true);
//        memberUser.setUsername(UUID.fastUUID().toString(true));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int resetPassErrorNum(Long id) {
        int count = superManager.resetPassErrorNum(id);
        superManager.delCache(id);
        return count;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void incrPasswordErrorNumById(Long id) {
        superManager.incrPasswordErrorNumById(id);
        superManager.delCache(id);
    }

    @Override
    public boolean checkMobile(String value, Long id) {
        return superManager.count(Wraps.<MemberUser>lbQ().eq(MemberUser::getMobile, value).ne(MemberUser::getId, id)) > 0;
    }

    @Override
    public MemberUser getUserByUsername(String username) {
        return superManager.getUserByUsername(username);
    }

    @Override
    public MemberUser getUserByMobile(String mobile) {
        return superManager.getUserByMobile(mobile);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateAvatar(DefUserAvatarUpdateVO data) {
        ArgumentAssert.isFalse(data.getAppendixAvatar() == null, "请上传或选择头像");
        boolean flag = appendixService.save(AppendixSaveVO.build(data.getId(), AppendixType.Shop.MEMBER__USER__AVATAR, data.getAppendixAvatar()));
        superManager.delCache(data.getId());
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updatePassword(DefUserPasswordUpdateVO data) {
        ArgumentAssert.notEmpty(data.getOldPassword(), "请输入旧密码");
        MemberUser memberUser = superManager.getById(data.getId());
        ArgumentAssert.notNull(memberUser, "用户不存在");
        ArgumentAssert.equals(memberUser.getId(), ContextUtil.getUserId(), "只能修改自己的密码");
        String oldPassword = SecureUtil.sha256(data.getOldPassword() + memberUser.getSalt());
        ArgumentAssert.equals(memberUser.getPassword(), oldPassword, "旧密码错误");

        return updateUserPassword(memberUser.getId(), data.getPassword(), memberUser.getSalt());
    }

    private boolean updateUserPassword(Long id, String password, String salt) {
        if (StrUtil.isEmpty(salt)) {
            salt = RandomUtil.randomString(20);
        }
        String defPassword = SecureUtil.sha256(password + salt);

        boolean flag = superManager.update(Wrappers.<MemberUser>lambdaUpdate()
                .set(MemberUser::getPassword, defPassword)
                .set(MemberUser::getPasswordErrorNum, 0L)
                .set(MemberUser::getPasswordErrorLastTime, null)
                .eq(MemberUser::getId, id)
        );
        superManager.delCache(id);
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateMobile(DefUserMobileUpdateVO data) {
        Long id = ContextUtil.getUserId();
        MemberUser memberUser = superManager.getById(id);
        ArgumentAssert.notNull(memberUser, "会员用户不存在");
        memberUser.setMobile(data.getMobile());
        superManager.updateById(memberUser);

        // 淘汰旧手机缓存
        cacheOps.del(MemberUserMobileCacheKeyBuilder.builder(memberUser.getMobile()));
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateBaseInfo(DefUserBaseInfoUpdateVO data) {
        MemberUser old = getById(data.getId());
        MemberUser memberUser = BeanUtil.toBean(data, MemberUser.class);
        if (data.getLogo() != null) {
            appendixService.save(AppendixSaveVO.build(data.getId(), AppendixType.Shop.MEMBER__USER__AVATAR, data.getLogo()));
        }
        boolean flag = superManager.updateById(memberUser);
//        if (StrUtil.isAllNotEmpty(data.getIdCard(), old.getCardId()) && !StrUtil.equals(old.getCardId(), data.getIdCard())) {
//            cacheOps.del(MemberUserIdCardCacheKeyBuilder.builder(old.getCardId()));
//        }
        return flag;
    }

}


