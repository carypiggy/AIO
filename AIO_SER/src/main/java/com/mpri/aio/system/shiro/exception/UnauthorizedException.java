package com.mpri.aio.system.shiro.exception;


/**
 * 登陆自定义异常
 * @author Cary
 * @date 2018年8月15日
 */
public class UnauthorizedException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	public UnauthorizedException(String msg) {
        super(msg);
    }

    public UnauthorizedException() {
        super();
    }
}
