package com.mpri.aio.system.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/***
 * 实现JWTToken
 * @author Cary
 * @date 2018年8月15日
 */
public class JWTToken implements AuthenticationToken{
	
	private static final long serialVersionUID = 1L;
	// 密钥
    private String token;

    public JWTToken(String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }

}
