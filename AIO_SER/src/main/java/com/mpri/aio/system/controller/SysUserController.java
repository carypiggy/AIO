package com.mpri.aio.system.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.utils.IdGen;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysUserService;



@RestController
@RequestMapping("/sys/sysuser")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserService sysUserService;
	
	
	/**
	 * 获取用户列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param SysUser
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SysUser> list(int pageNo,int pageSize,SysUser SysUser) {
		PageIo<SysUser> pageInfo =  sysUserService.loadByPage(pageNo,pageSize,SysUser);							
		return pageInfo;
	}
	
	/**
	 * 增加或者更新用户
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param SysUser
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@Validated SysUser sysUser){
		sysUser.setSafecode(IdGen.uuid());
		ByteSource salt = ByteSource.Util.bytes(sysUser.getSafecode());
		//加盐炒三次safecode=salt
		String result = new Md5Hash(sysUser.getPassword(),salt,3).toString();
		sysUser.setPassword(result);
		sysUser.setCreateDate(new Date());
		sysUserService.save(sysUser);	
		return SUCCESS;
	}	
	
	/**
	 * 删除用户（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param SysUser
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SysUser sysUser) {
		sysUserService.delete(sysUser);
		return SUCCESS;
	}
	
	/**
	 * 根据id获取用户
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param id
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SysUser get(SysUser sysUser) {
		return sysUserService.get(sysUser);		
	}
	
	/**
	 * 根据username获取用户
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param username
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/getusername")
	public SysUser getSysUserByUsername(@RequestParam("username") String username) {
		return sysUserService.getSysUserByUsername(username);	
	}
	
	
}
