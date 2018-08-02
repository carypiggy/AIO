package com.mprs.aio.system.shiro;


import java.io.Serializable;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mprs.aio.common.servlet.ValidateCodeServlet;
import com.mprs.aio.system.controller.LoginController;
import com.mprs.aio.system.model.SysUser;
import com.mprs.aio.system.service.SysUserService;
import com.mprs.aio.system.utils.UserUtils;
/**
 * 系统安全认证实现类
 * @author Cary
 * @date 2018年8月2日
 */
@Service
public class ShiroRealm extends AuthorizingRealm {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
    @Autowired
    private SysUserService sysUserService;
    
    @Autowired
	private SessionDAO sessionDao;
    
    public SessionDAO getSessionDao() {
		return sessionDao;
	}
    
    private SimpleAuthenticationInfo info = null;

    /**
     * 1.doGetAuthenticationInfo，获取认证消息，如果数据库中没有数，返回null，如果得到了正确的用户名和密码，返回指定类型的对象
     *
     * 2.AuthenticationInfo 可以使用SimpleAuthenticationInfo实现类，封装正确的用户名和密码。
     *
     * 3.token参数 就是我们需要认证的token
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 将token装换成UsernamePasswordToken
        UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;
       
        int activeSessionSize = getSessionDao().getActiveSessions(false).size();
        
		if (logger.isDebugEnabled()){
			logger.debug("login submit, active session size: {}, username: {}", activeSessionSize, upToken.getUsername());
		}
		
		// 校验登录验证码
		if (LoginController.isValidateCodeLogin(upToken.getUsername(), false, false)){
			Session session = UserUtils.getSession();
			String code = (String)session.getAttribute(ValidateCodeServlet.VALIDATE_CODE);
			if (upToken.getCaptcha() == null || !upToken.getCaptcha().toUpperCase().equals(code)){
				throw new AuthenticationException("msg:验证码错误, 请重试.");
			}
		}
		
		
        // 获取用户名即可
        String username = upToken.getUsername();
        // 查询数据库，是否查询到用户名和密码的用户
        SysUser sysUser = sysUserService.getSysUserByUsername(username);

        if(sysUser != null) {
            // 如果查询到了，封装查询结果，返回给我们的调用
            Object principal =  sysUser.getUsername();
            Object credentials = sysUser.getPassword();

            // 获取盐值，即安全码
            ByteSource salt = ByteSource.Util.bytes(sysUser.getSafecode());
            String realmName = this.getName();
            // 将账户名，密码，盐值，realmName实例化到SimpleAuthenticationInfo中交给Shiro来管理
            info = new SimpleAuthenticationInfo(principal, credentials, salt,realmName);
            
        }else {
            // 如果没有查询到，抛出一个异常
            throw new AuthenticationException();
        }

        return info;
    }
    
    /**
     * 此方法调用  hasRole,hasPermission的时候才会进行回调.
     *
     * 权限信息.(授权):
     * 1、如果用户正常退出，缓存自动清空；
     * 2、如果用户非正常退出，缓存自动清空；
     * 3、如果我们修改了用户的权限，而用户不退出系统，修改的权限无法立即生效。
     * （需要手动编程进行实现；放在service进行调用）
     * 在权限修改后调用realm中的方法，realm已经由spring管理，所以从spring中获取realm实例，
     * 调用clearCached方法；
     * :Authorization 是授权访问控制，用于对用户进行的操作授权，证明该用户是否允许进行当前操作，如访问某个链接，某个资源文件等。
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
         /*
        * 当没有使用缓存的时候，不断刷新页面的话，这个代码会不断执行，
        * 当其实没有必要每次都重新设置权限信息，所以我们需要放到缓存中进行管理；
        * 当放到缓存中时，这样的话，doGetAuthorizationInfo就只会执行一次了，
        * 缓存过期之后会再次执行。
        */
        System.out.println("权限配置-----》MyShiroRealm.doGetAuthorizationInfo()");

        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        SysUser sysUser = (SysUser)principalCollection.getPrimaryPrincipal();

        //实际项目中，这里可以根据实际情况做缓存，如果不做，Shiro自己也是有时间间隔机制，2分钟内不会重复执行该方法
        //UserInfo userInfo = userInfoService.findByUsername(username)


        //权限单个添加;
        // 或者按下面这样添加
        //添加一个角色,不是配置意义上的添加,而是证明该用户拥有admin角色
//     authorizationInfo.addRole("admin");
        //添加权限
//     authorizationInfo.addStringPermission("userInfo:query");

        //在认证成功之后返回.
        //设置角色信息.
        //支持 Set集合,
        //用户的角色对应的所有权限，如果只使用角色定义访问权限，下面的四行可以不要
//        List<Role> roleList=user.getRoleList();
//        for (Role role : roleList) {
//            info.addStringPermissions(role.getPermissionsName());
//        }
//        for(SysRole role:userInfo.getRoleList()){
//            simpleAuthorizationInfo.addRole(role.getRole());
//            for(SysPermission p:role.getPermissions()){
//                simpleAuthorizationInfo.addStringPermission(p.getPermission());
//                System.out.println("user拥有权限："+p.getPermission());
//            }
//        }
        return simpleAuthorizationInfo;

    }
    

    
	/**
	 * 授权用户信息
	 */
	public static class Principal implements Serializable {

		private static final long serialVersionUID = 1L;
		
		private String id; // 编号
		private String userName; // 登录名
		private String name; // 姓名

		public Principal(SysUser user, boolean mobileLogin) {
			this.id = user.getId();
			this.userName = user.getUsername();
			this.name = user.getName();
		}

		public String getId() {
			return id;
		}

		public String getUserName() {
			return userName;
		}

		public String getName() {
			return name;
		}


		/**
		 * 获取SESSIONID
		 */
		public String getSessionid() {
			try{
				return (String) UserUtils.getSession().getId();
			}catch (Exception e) {
				return "";
			}
		}
		
		@Override
		public String toString() {
			return id;
		}

	}
    
}
