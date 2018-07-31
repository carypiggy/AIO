package com.mprs.aio.system.mapper;

import com.mprs.aio.base.mapper.CrudMapper;
import com.mprs.aio.system.model.SysUser;

/**
 * 用户信息mapper
 * @author Cary
 * @Date  2018年7月31日
 */
public interface SysUserMapper extends CrudMapper<SysUser>{
	/**
	 * 根据用户名获取用户
	 * @param username
	 * @return
	 */
    SysUser getSysUserByUsername(SysUser sysUser);
}