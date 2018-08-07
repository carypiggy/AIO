package com.mprs.aio.common.page;


import java.util.List;

import com.github.pagehelper.PageInfo;
/**
 * 
* <p>Title: PageIo</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月6日
 */
public class PageIo<T> extends PageInfo<T>{

	private static final long serialVersionUID = 1L;
	
	private int code;
	
	private String msg;
	
	private Long count;
	
	private final static Integer STATU_CODE = 200;

	public PageIo(List<T> list) {
		super(list, 8);
		this.code = STATU_CODE;
		this.count=super.getTotal();
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}
}
