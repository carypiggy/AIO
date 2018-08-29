package com.mpri.aio.system.shiro;

import java.util.Date;

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
	
	 // web有效时间15分钟
    private static final long EXPIRE_TIME = 15*60*1000;
    
    // web逾期时间3分钟
    public static final long REFESH_TIME = 5*60*1000;
    
    //移动有效时间7天
    private static final long APP_EXPIRE_TIME = 7*24*60*1000;
    
    // 移动逾期时间1天
    public static final long APP_REFESH_TIME = 1*24*60*1000;
    
    //来源-web
    public static final String FROM_WEB = "WEB";
    
    //来源-app
    public static final String FROM_APP = "APP";
    
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
     *  获得token中的信息无需secret解密也能获得 
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
     * 获得token中的过期时间
     * @return token中包含的用户名
     */
    public static long getTokenTime(String token) {
        try {
        	DecodedJWT jwt = JWT.decode(token);
			long tokenTime=jwt.getExpiresAt().getTime();
			return tokenTime;
        } catch (JWTDecodeException e) {
            return 0;
        }
    }

    /**
     * 生成签名,5min后过期
     * @param username 用户名
     * @param secret 用户的密码
     * @return 加密的token
     */
    public static String sign(String username, String secret,String comeFrom) {
        try {
        	
        	Algorithm algorithm = Algorithm.HMAC256(secret);
        	
        	// 附带username信息
        	if(comeFrom.equals(FROM_WEB)) {
        		Date date = new Date(System.currentTimeMillis()+EXPIRE_TIME);
        		return JWT.create().withClaim("username", username).withExpiresAt(date).sign(algorithm);
        	}else if(comeFrom.equals(FROM_APP)){
        		Date date = new Date(System.currentTimeMillis()+APP_EXPIRE_TIME);	
        		return JWT.create().withClaim("username", username).withExpiresAt(date).sign(algorithm);
        	}else {
        		Date date = new Date(System.currentTimeMillis()+EXPIRE_TIME);
        		return JWT.create().withClaim("username", username).withExpiresAt(date).sign(algorithm);
        	}
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
//    	DecodedJWT jwt = JWT.decode(token);
//    	Date now=new Date();
//    	long nowTime=now.getTime();
//    	long tokenTime=jwt.getExpiresAt().getTime();
//    	String password=getPassword(token);
//    	String username=getUsername(token);
//    	if((nowTime-tokenTime)<REFESH_TIME) {
//    		return sign(username,password);
//    	}else {
    		
    		return token;
//    	}
    }
}
