package com.mpri.aio.common.response;

import java.io.Serializable;

/**
 * token 返回对象
 * @author Cary
 * @date 2018年8月25日
 */
public class RestToken implements Serializable{

	private static final long serialVersionUID = 1L;

	public String token;
	
	public long tokenTime;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public long getTokenTime() {
		return tokenTime;
	}

	public void setTokenTime(long tokenTime) {
		this.tokenTime = tokenTime;
	}
	
	
}
