package com.mpri.aio.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.system.model.SysUser;

/**
 * 用户信息mapper
 * @author Cary
 * @Date  2018年7月31日
 */
@Mapper
public interface SysUserMapper extends CrudMapper<SysUser>{
	/**
	 * 根据用户名获取用户
	 * @param username
	 * @return
	 */
    SysUser getSysUserByUsername(SysUser sysUser);
}