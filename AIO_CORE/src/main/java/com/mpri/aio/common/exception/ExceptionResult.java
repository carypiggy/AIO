package com.mpri.aio.common.exception;

import java.io.Serializable;

/**
 * 异常处理静态信息封装类
 * @author Cary
 * @date 2018年8月6日
 */
public class ExceptionResult implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final Integer REQUEST_SUCCESS = 200;
	
	public static final Integer NO_PERMISSION= 401;
	
	public static final Integer NOT_FOUND = 404;
	
	public static final Integer SYS_ERROR = 500;
	
	
	
}
