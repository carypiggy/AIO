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
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpri.aio.common.exception.CaptchaException;
import com.mpri.aio.common.utils.StringUtils;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysMenuService;
import com.mpri.aio.system.service.SysRoleService;
import com.mpri.aio.system.service.SysUserService;

/**
 * 系统安全认证实现类
 * @author Cary
 * @date 2018年8月2日
 */
@Service
public class ShiroRealm extends AuthorizingRealm {
	
    @Autowired
    private SysUserService sysUserService;
    
    @Autowired
    private SysRoleService sysRoleService;
    
    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 登陆认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 将token装换成UsernamePasswordToken
        
        ShiroToken token = (ShiroToken) authenticationToken;
        String severCode = (String) SecurityUtils.getSubject().getSession().getAttribute("authCode");
        String clientCode = token.getAuthCode();
        if(StringUtils.isBlank(clientCode)) {
            throw new CaptchaException("验证码不能为空！");
        }
        if(!severCode.equalsIgnoreCase(clientCode)) {
            throw new CaptchaException("验证码错误，请重新输入！");
        }
        //查询数据库是否存在
        SysUser sysUser = sysUserService.getSysUserByUsername(token.getUsername());
        if(null != sysUser) {
            Session session = SecurityUtils.getSubject().getSession();
            session.setAttribute("sysUser", sysUser);
            // 获取盐值，即安全码
            ByteSource salt = ByteSource.Util.bytes(sysUser.getSafecode());
            // 将账户名，密码，盐值，name实例化到SimpleAuthenticationInfo中交给Shiro来管理
            SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(sysUser.getUsername(), sysUser.getPassword(), salt,sysUser.getName());
            return authenticationInfo;
        } else {
            throw new UnknownAccountException("用户名不存在！"); //未找到账号
        }
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
    	 // TODO Auto-generated method stub  
         System.out.println("权限配置-->MyShiroRealm.doGetAuthorizationInfo()");  
    	 SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
         String username = (String) principalCollection.getPrimaryPrincipal();
         SysUser sysUser=sysUserService.getSysUserByUsername(username);
         //保存角色
         List<SysRole> roles = sysRoleService.loadRoleByUser(sysUser.getId());
         
         for (SysRole role : roles) {
             authorizationInfo.addRole(role.getName());
         }
         //保存权限
         List<SysMenu> sysMenus = sysMenuService.loadMenuByUser(sysUser.getId());
         for (SysMenu sysMenu : sysMenus) {
             authorizationInfo.addStringPermission(sysMenu.getPermission());
         }
         return authorizationInfo;
    }
    
}
