package com.mprs.aio.base.service;

import java.util.List;

import com.mprs.aio.base.model.SysUsers;

/**
 * 用户管理接口
 * @author Cary
 * @date 2018年7月22日
 */
public interface SysUsersService {
	
	/**
	 * 新增用户信息
	 * @param sysUsers
	 * @return
	 */
	public int addSysUsers(SysUsers sysUsers);
	
	/**
	 * 修改用户信息
	 * @param sysUsers
	 * @return
	 */
	public int editSysUsers(SysUsers sysUsers);
	
	/**
	 * 使用id查询用户信息
	 * @param id
	 * @return
	 */
	public SysUsers getSysUsers(long id);
	
	/**
	 * 获取所有用户信息
	 * @return
	 */
	public List<SysUsers> loadSysUsers();
	
	
}
