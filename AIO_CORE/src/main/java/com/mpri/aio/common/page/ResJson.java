package com.mpri.aio.common.page;

import java.util.List;


/**
 * 返回的数据格式
* <p>Title: ResJson</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月13日
 */
public class ResJson<T> {
	
	private final static Integer TREEGRID_CODE = 0;
	
	private String msg;
	
	private Integer code;
	
	private List<T> data;

		
	public ResJson() {
		super();
		this.code = TREEGRID_CODE;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public Integer getCode() {
		return code;
	}


	public void setCode(Integer code) {
		this.code = code;
	}


	public List<T> getData() {
		return data;
	}


	public void setData(List<T> data) {
		this.data = data;
	}
	
}
