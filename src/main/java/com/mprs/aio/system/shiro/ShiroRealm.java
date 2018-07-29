package com.mprs.aio.system.shiro;


import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.mprs.aio.system.model.SysUser;
import com.mprs.aio.system.service.SysUserService;

public class ShiroRealm extends AuthenticatingRealm {
	
    @Autowired
    private SysUserService sysUserService;

    private SimpleAuthenticationInfo info = null;

    /**
     * 1.doGetAuthenticationInfo，获取认证消息，如果数据库中没有数，返回null，如果得到了正确的用户名和密码，
     * 返回指定类型的对象
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
        // 获取用户名即可
        String username = upToken.getUsername();
        // 查询数据库，是否查询到用户名和密码的用户
        SysUser sysUser = sysUserService.getSysUserByUsername(username);

        if(sysUser != null) {
            // 如果查询到了，封装查询结果，返回给我们的调用
            Object principal =  sysUser.getUsername();
            Object credentials = sysUser.getPassword();

            // 获取盐值，即用户名
            ByteSource salt = ByteSource.Util.bytes(sysUser.getId());
            String realmName = this.getName();
            // 将账户名，密码，盐值，realmName实例化到SimpleAuthenticationInfo中交给Shiro来管理
            info = new SimpleAuthenticationInfo(principal, credentials, salt,realmName);
            
        }else {
            // 如果没有查询到，抛出一个异常
            throw new AuthenticationException();
        }

        return info;
    }
}
