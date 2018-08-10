package com.mpri.aio.system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mpri.aio.base.service.CrudService;
import com.mpri.aio.system.mapper.SysRoleMapper;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.model.SysUser;
/**
 * 
 * @author Cary
 * @Date  2018年7月31日
 */
@Service
public class SysRoleService  extends CrudService<SysRoleMapper, SysRole>{
    
	
	/**
	 * 根据用户id获取角色集合
	 * @param username
	 * @return
	 */
	public List<SysRole> loadRoleByUser(String id) {
		SysUser sysUser=new SysUser();
		sysUser.setId(id);
		return mapper.loadRoleByUser(sysUser);
	}
}