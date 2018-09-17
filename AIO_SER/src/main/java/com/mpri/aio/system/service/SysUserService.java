package com.mpri.aio.system.service;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpri.aio.base.service.CrudService;
import com.mpri.aio.system.mapper.SysUserMapper;
import com.mpri.aio.system.model.SysUser;

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
	@Cacheable(value = "userCache", key ="#username")
	public SysUser getSysUserByUsername(String username) {
		SysUser sysUser=new SysUser();
		sysUser.setUsername(username);
		return mapper.getSysUserByUsername(sysUser);
	}

	/**
	 * 获取既有用户数
	 * @param username
	 * @return
	 */
	public int getUserNum(String username) {
		SysUser sysUser=new SysUser();
		sysUser.setUsername(username);
		return mapper.getUserNum(sysUser);
	}
    /**
     * 插入用户和角色信息
    * <p>Title: insertUserRole</p>  
    * <p>Description: </p>  
    * @param sysUser
     */
	@Transactional(readOnly = false)
	public void insertUserRole(SysUser sysUser) {
		mapper.deleteUserRole(sysUser);
		mapper.insertUserRole(sysUser);
	};
	
    /**
     * 删除用户和角色信息
    * <p>Title: insertUserRole</p>  
    * <p>Description: </p>  
    * @param sysUser
     */
	@Transactional(readOnly = false)
	public void deleteUserRole(SysUser sysUser) {
		mapper.deleteUserRole(sysUser);
	};

	/**
	 * 根据用户名获取密码
	 * @param username
	 * @return
	 */
	public SysUser getPwdByUsername(SysUser sysUser) {
		return mapper.getSysUserByUsername(sysUser);
	}

}