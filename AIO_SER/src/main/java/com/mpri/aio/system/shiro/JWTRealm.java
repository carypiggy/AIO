package com.mpri.aio.system.shiro;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.mpri.aio.common.exception.CaptchaException;
import com.mpri.aio.common.exception.UnauthorizedException;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.common.utils.StringUtils;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysMenuService;
import com.mpri.aio.system.service.SysRoleService;
import com.mpri.aio.system.service.SysUserService;

/**
 * JWT登陆验证实现
 * @author Cary
 * @date 2018年8月15日
 */
public class JWTRealm extends AuthorizingRealm {

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysRoleService sysRoleService;

	@Autowired
	private SysMenuService sysMenuService;

	@Override
	public boolean supports(AuthenticationToken token) {
		return token instanceof JWTToken;
	}

	/**
	 * 默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
		String token = (String) auth.getCredentials();
	        
		// 解密获得username，用于和数据库进行对比
		String username = JWTUtil.getUsername(token);
		
		if (username == null) {
		    throw new AuthenticationException("token invalid");
		}
		
		//获取用户是数据
		SysUser sysUser=sysUserService.getSysUserByUsername(username);
		
		if (sysUser == null) {
		    throw new AuthenticationException("用户不存在!");
		}
		
		if (!JWTUtil.verify(token, username, sysUser.getPassword())) {
		    throw new AuthenticationException("Token认证失败");
		}
		
		return new SimpleAuthenticationInfo(token, token, "jwtRealm");

	}
	
	
	
	/**
	 * 用户获取授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		//根据token获取uername
		String username = JWTUtil.getUsername(principals.toString());
		//获取用户对象
		SysUser sysUser = sysUserService.getSysUserByUsername(username);
		
		//保存角色
        List<SysRole> roles = sysRoleService.loadRoleByUser(sysUser.getId());
        
        for (SysRole role : roles) {
            authorizationInfo.addRole(role.getName());
        }
		
		//保存权限
        List<SysMenu> sysMenus = sysMenuService.loadPerByUser(sysUser.getId());
        for (SysMenu sysMenu : sysMenus) {
            authorizationInfo.addStringPermission(sysMenu.getPermission());
        }
        
		return authorizationInfo;
	}

}
