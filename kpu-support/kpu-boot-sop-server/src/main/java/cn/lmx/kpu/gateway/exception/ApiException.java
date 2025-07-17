package cn.lmx.kpu.gateway.exception;


import cn.lmx.kpu.gateway.message.ErrorEnum;
import cn.lmx.kpu.gateway.message.IError;

import java.util.Locale;

/**
 * @author 六如
 */
public class ApiException extends RuntimeException {
    private static final long serialVersionUID = 8278005515613227643L;

    private final transient Locale locale;

    private final transient ErrorEnum errorEnum;
    private final transient Object[] params;

    public ApiException(ErrorEnum errorEnum, Locale locale, Object... params) {
        this.errorEnum = errorEnum;
        this.params = params;
        this.locale = locale;
    }

    public ApiException(Throwable cause, ErrorEnum errorEnum, Locale locale, Object... params) {
        super(cause);
        this.errorEnum = errorEnum;
        this.params = params;
        this.locale = locale;
    }

    public IError getError() {
        return errorEnum.getError(locale, params);
    }

    public ErrorEnum getErrorEnum() {
        return errorEnum;
    }

    @Override
    public String getMessage() {
        String message = super.getMessage();
        return message == null ? errorEnum.getSubCode() : message;
    }

}
