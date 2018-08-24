package com.mpri.aio.system.shiro;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
/**
 * JTW帮助类
 * @author Cary
 * @date 2018年8月15日
 */
public class JWTUtil  {
	
	 // 过期时间5分钟
    private static final long EXPIRE_TIME = 15*60*1000;
    
    // 逾期时间3分钟
    public static final long REFESH_TIME = 3*60*1000;
    
    /**
     * 校验token是否正确
     * @param token 密钥
     * @param secret 用户的密码
     * @return 是否正确
     */
    public static boolean verify(String token, String username, String secret) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(secret);
            JWTVerifier verifier = JWT.require(algorithm)
                    .withClaim("username", username)
                    .build();
          
            DecodedJWT jwt = verifier.verify(token);
            return true;
        } catch (Exception exception) {
            return false;
        }
    }

    /**
     * 获得token中的信息无需secret解密也能获得
     * @return token中包含的用户名
     */
    public static String getUsername(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("username").asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }
    
    
    /**
     * 获得token中的信息无需secret解密也能获得
     * @return token中包含的用户名
     */
    public static String getPassword(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("password").asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }

    /**
     * 生成签名,5min后过期
     * @param username 用户名
     * @param secret 用户的密码
     * @return 加密的token
     */
    public static String sign(String username, String secret) {
        try {
            Date date = new Date(System.currentTimeMillis()+EXPIRE_TIME);
            Algorithm algorithm = Algorithm.HMAC256(secret);
            // 附带username信息
            return JWT.create()
                    .withClaim("username", username)
                    .withExpiresAt(date)
                    .sign(algorithm);
        } catch (Exception e) {
            return null;
        }
    }
    
    /**
     * 刷新并返回新Token
     * @param token
     * @return
     */
    public static String refresh(String token) {
    	DecodedJWT jwt = JWT.decode(token);
    	Date now=new Date();
    	long nowTime=now.getTime();
    	long tokenTime=jwt.getExpiresAt().getTime();
    	String password=getPassword(token);
    	String username=getUsername(token);
    	if((nowTime-tokenTime)<REFESH_TIME) {
    		return sign(username,password);
    	}else {
    		
    		return token;
    	}
    }
}
