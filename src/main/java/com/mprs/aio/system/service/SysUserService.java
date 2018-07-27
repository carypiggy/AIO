package com.mprs.aio.system.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.mprs.aio.system.model.SysUser;

/**
 * 用户管理接口
 * @author Cary
 * @date 2018年7月22日
 */
public interface SysUserService {
	
	/**
	 * 新增用户信息
	 * @param sysUsers
	 * @return
	 */
	public int addSysUsers(SysUser sysUsers);
	
	/**
	 * 修改用户信息
	 * @param sysUsers
	 * @return
	 */
	public int editSysUsers(SysUser sysUsers);
	
	/**
	 * 使用id查询用户信息
	 * @param id
	 * @return
	 */
	public SysUser getSysUser(String id);
	
	/**
	 * 获取所有用户信息
	 * @return
	 */
	public List<SysUser> loadSysUsers();
	
    /**
     * 分页查询
     * @param pageNo 页号
     * @param pageSize 每页显示记录数
     * @return
     */
    Page<SysUser> findByPage(int pageNo, int pageSize);
    
    /**
     * 根据登录名获取用户
     * @param login_name
     * @return
     */
    public SysUser getSysUserByUsername(String username);
}