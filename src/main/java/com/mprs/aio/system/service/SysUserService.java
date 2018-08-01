package com.mprs.aio.system.service;

import org.springframework.stereotype.Service;

import com.mprs.aio.base.service.CrudService;
import com.mprs.aio.system.mapper.SysUserMapper;
import com.mprs.aio.system.model.SysUser;

/**
* 用户信息接口实现
* @author Cary
* @date 2018年7月22日
*/
@Service
public class SysUserService extends CrudService<SysUserMapper, SysUser>  {
	

	/**
	 * 根据用户名获取用户对象
	 * @param username
	 * @return
	 */
	public SysUser getSysUserByUsername(String username) {
		
		SysUser sysUser=new SysUser();
		sysUser.setUsername(username);
		return mapper.getSysUserByUsername(sysUser);
	}
	

}