import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.model.enumeration.system.ResourceTypeEnum;

public class Test {
    public static void main(String[] args) {
        String password = "123456";
        String salt = RandomUtil.randomString(20);
        String defPassword = SecureUtil.sha256(password + salt);
        System.out.println(StrUtil.format("password: {}, salt: {}, defPassword: {}", password, salt, defPassword));
        ArgumentAssert.isFalse(StrUtil.containsAny( "40", ResourceTypeEnum.BUTTON.getCode(), ResourceTypeEnum.FIELD.getCode(), ResourceTypeEnum.DATA.getCode()), "资源类型不正确");
    }

}
