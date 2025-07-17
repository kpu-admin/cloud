package cn.lmx.kpu.gateway.exception;

import cn.lmx.kpu.gateway.message.ErrorEnum;
import lombok.Getter;

/**
 * @author 六如
 */
@Getter
public class SignException extends Exception {

    private static final long serialVersionUID = 4049365045207852768L;

    public SignException(ErrorEnum errorEnum) {
        this.errorEnum = errorEnum;
    }

    public SignException(ErrorEnum errorEnum, Throwable cause) {
        super(cause);
        this.errorEnum = errorEnum;
    }

    private final ErrorEnum errorEnum;

}
