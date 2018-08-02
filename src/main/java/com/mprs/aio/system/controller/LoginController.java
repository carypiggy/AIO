package com.mprs.aio.system.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mprs.aio.base.controller.BaseController;
import com.mprs.aio.system.shiro.ShiroToken;

/**
 * 登陆控制器
 * @author Cary
 * @Date  2018年7月27日
 */

@Controller
public class LoginController extends BaseController {
	
	
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(String username, String password, String authCode, HttpSession session) {
		

		// 获得当前Subject
		Subject currentUser = SecurityUtils.getSubject();
		// 验证用户是否验证，即是否登录
		if (!currentUser.isAuthenticated()) {
			String msg = "";
			// 把用户名和密码封装为 UsernamePasswordToken 对象
			ShiroToken token = new ShiroToken(username,password,authCode);
			
			// remembermMe记住密码
			token.setRememberMe(true);
			try {
				// 执行登录.
				currentUser.login(token);
 
				// 登录成功...
				return "redirect:/LoginSuccess.action";
			} catch (IncorrectCredentialsException e) {
				msg = "登录密码错误";
				System.out.println("登录密码错误!!!" + e);
			} catch (ExcessiveAttemptsException e) {
				msg = "登录失败次数过多";
				System.out.println("登录失败次数过多!!!" + e);
			} catch (LockedAccountException e) {
				msg = "帐号已被锁定";
				System.out.println("帐号已被锁定!!!" + e);
			} catch (DisabledAccountException e) {
				msg = "帐号已被禁用";
				System.out.println("帐号已被禁用!!!" + e);
			} catch (ExpiredCredentialsException e) {
				msg = "帐号已过期";
				System.out.println("帐号已过期!!!" + e);
			} catch (UnknownAccountException e) {
				msg = "帐号不存在";
				System.out.println("帐号不存在!!!" + e);
			} catch (UnauthorizedException e) {
				msg = "您没有得到相应的授权！";
				System.out.println("您没有得到相应的授权！" + e);
			} catch (Exception e) {
				System.out.println("出错！！！" + e);
			}
			return "/index";
		}

		return "login.html";
	}
	
	
}
