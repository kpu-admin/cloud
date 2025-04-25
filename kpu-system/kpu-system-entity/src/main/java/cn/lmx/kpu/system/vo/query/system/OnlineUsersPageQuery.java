package cn.lmx.kpu.system.vo.query.system;

import lombok.Data;

/**
 * 在线用户
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Data
public class OnlineUsersPageQuery {

    /**
     * 用户名;
     */
    private String username;
    private String nickName;
    private String sessionId;

}
