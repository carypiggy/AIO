package com.mprs.aio.gen.model;

import java.io.Serializable;

/**
 * 
* <p>Title: ExecuteResult</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月2日
 */
public class GenExecuteResult implements Serializable {
	private static final long serialVersionUID = 123126L;
	/**
	 * 结果值
	 */
	private Integer code;
	/**
	 * 结果消息
	 */
	private String message;
	/**
	 * 结果数据
	 */
	private Object data;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
