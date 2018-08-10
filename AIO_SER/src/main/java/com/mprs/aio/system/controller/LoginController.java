package com.mprs.aio.system.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mprs.aio.base.controller.BaseController;
import com.mprs.aio.system.shiro.ShiroToken;

/**
 * 登陆控制器
 * @author Cary
 * @Date  2018年7月27日
 */

@RestController
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
				return "/index.html";
			} catch (Exception e) {
				msg = "登录失败";
				System.out.println("登录失败" + e);
			} 
			return "/login.html";
		}else {
			return "/index.html";
		}
	}
	
	
	/**
	 * 测试add
	 */
	@RequestMapping(value = "/tsAdd", method = RequestMethod.GET)
	@RequiresPermissions("sys:add")
	public String tsAdd() {
		System.out.println("add");
		return "/index.html";
	}
	
	/**
	 * 测试add
	 */
	@RequestMapping(value = "/tsEdit", method = RequestMethod.GET)
	@RequiresPermissions("sys:edit")
	public String tsEdit() {
		System.out.println("edit");
		return "/index.html";
	}
	
	/**
	 * 测试add
	 */
	@RequestMapping(value = "/tsDel", method = RequestMethod.GET)
	@RequiresPermissions("sys:del")
	public String tsDel() {
		System.out.println("del");
		return "/index.html";
	}
	
}
