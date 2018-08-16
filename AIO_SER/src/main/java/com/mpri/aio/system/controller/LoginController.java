package com.mpri.aio.system.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.exception.UnauthorizedException;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysUserService;
import com.mpri.aio.system.shiro.JWTUtil;

/**
 * 登陆控制器
 * @author Cary
 * @Date  2018年7月27日
 */

@RestController
public class LoginController extends BaseController {
	
	@Autowired
	private SysUserService sysUserService;
	
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public RestResponse<String>  login(@RequestParam("username") String username,
            			@RequestParam("password") String password, 
            			@RequestParam("authCode")String authCode,HttpSession session) {
		
		SysUser sysUser=sysUserService.getSysUserByUsername(username);
		
		//加盐处理密码
		String safeCode=sysUser.getSafecode();
		ByteSource salt = ByteSource.Util.bytes(safeCode);
		String result = new Md5Hash(password,salt,3).toString();
		
		//验证码获取
		String severCode = (String)session.getAttribute("authCode");
        String clientCode = authCode;
        //首先校认验证码
        if(true) {
        	//登陆密码校验
    		if (sysUser.getPassword().equals(result)) {
                return new RestResponse<String>(0, "登陆成功！", JWTUtil.sign(username, result));
            } else {
                throw new UnauthorizedException();
            }
        	
        }else {
        	return new RestResponse<String>(1, "验证码错误！", null);
        }
	}
	
	
	@GetMapping(path = "/401")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public RestResponse<String> unauthorized() {
        return new RestResponse<>(0, "Unauthorized", null);
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
