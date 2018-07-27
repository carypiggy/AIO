package com.mprs.aio.system.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mprs.aio.system.service.SysUserService;

/**
 * 登陆控制器
 * @author Cary
 * @Date  2018年7月27日
 */

@Controller
public class loginController {


    private final Logger logger = LoggerFactory.getLogger(loginController.class);


    @RequestMapping("/doLogin")
    public String doLogin(@RequestParam("username") String username,
                          @RequestParam("password") String password) {
        // 创建Subject实例
        Subject currentUser = SecurityUtils.getSubject();

        // 将用户名及密码封装到UsernamePasswordToken
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);

        try {
            currentUser.login(token);
            // 判断当前用户是否登录
            if (currentUser.isAuthenticated() == true) {
            	System.out.println("登录成功");
                return "index.html";
            }
        } catch (AuthenticationException e) {
            e.printStackTrace();
            System.out.println("登录失败");
        }
        return "/loginPage.html";
    }

//    @RequestMapping("/doRegister")
//    public String doRegister(@RequestParam("username") String username,
//                             @RequestParam("password") String password) {
//
//        boolean result = sysUserService.registerData(username,password);
//        if(result){
//            return "/login";
//        }
//        return "/register";
//    }

    @RequestMapping(value = "/login")
    public String login() {
        logger.info("login() 方法被调用");
        return "loginPage.html";
    }

//    @RequestMapping(value = "/register")
//    public String register() {
//        logger.info("register() 方法被调用");
//        return "registerPage.html";
//    }

	
	
	
	
	
	
}
