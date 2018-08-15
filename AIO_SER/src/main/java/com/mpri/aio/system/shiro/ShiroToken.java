package com.mpri.aio.system.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 用户和密码（包含验证码）令牌类
 * @author Cary
 * @date 2018年8月2日
 */
public class ShiroToken extends UsernamePasswordToken {

	private static final long serialVersionUID = 1L;
	
	private String authCode;
	
	private String token;

    public ShiroToken(String username, String password, String authCode) {
        super(username, password);
        this.authCode = authCode;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
    
    
	
}