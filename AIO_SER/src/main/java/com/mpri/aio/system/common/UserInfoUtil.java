package com.mpri.aio.system.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.mpri.aio.system.shiro.JWTUtil;

/**
 * 从request中获取username sysuserId
* <p>Title: UserInfo</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年10月11日
 */
@Component
public class UserInfoUtil {

	/**
	 * 
	* <p>Title: getUsernameByParms</p>  
	* <p>Description:根据token获取username </p>  
	* @param request
	* @return
	 */
	public static String getUsername(HttpServletRequest request) {
		String token=request.getHeader("Authorization");
		String username=JWTUtil.getUsername(token);
		return null == username ? null : username ;
	}
	
//	/**
//	 * 
//	* <p>Title: getUsernameByParms</p>  
//	* <p>Description:根据token获取username </p>  
//	* @param request
//	* @return
//	 */
//	public static String getUserId(HttpServletRequest request) {
//		String token=request.getHeader("Authorization");
//		String userId=JWTUtil.getUserId(token);
//		return null == userId ? null : userId ;
//	}
}
