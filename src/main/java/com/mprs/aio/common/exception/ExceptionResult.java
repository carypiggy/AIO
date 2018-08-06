package com.mprs.aio.common.exception;

import java.io.Serializable;

/**
 * 异常处理信息封装类
 * @author Cary
 * @date 2018年8月6日
 */
public class ExceptionResult<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final Integer NOT_FOUND = 404;
	
	public static final Integer SYS_ERROR = 500;
	
	
	//请求状态
    private int code;
    //信息
    private String message;
    //返回数据
    private T data;

    public ExceptionResult(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static <T> ExceptionResult<T> getInstance(int code, String message,T data) {
    	
        return new ExceptionResult<T>(code,message, data);
    }

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
    
}
