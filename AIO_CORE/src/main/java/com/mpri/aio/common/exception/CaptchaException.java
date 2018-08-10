package com.mpri.aio.common.exception;

import org.apache.shiro.authc.AccountException;

/**
 * 验证码异常提示类
 * @author Cary
 * @date 2018年8月2日
 */
public class CaptchaException extends AccountException {

	private static final long serialVersionUID = 1L;

	public CaptchaException() {
    }

    public CaptchaException(String message) {
        super(message);
    }

    public CaptchaException(Throwable cause) {
        super(cause);
    }

    public CaptchaException(String message, Throwable cause) {
        super(message, cause);
    }
}
