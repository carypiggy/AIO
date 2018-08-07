package com.mprs.aio.system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mprs.aio.base.service.CrudService;
import com.mprs.aio.system.mapper.SysMenuMapper;
import com.mprs.aio.system.model.SysMenu;
import com.mprs.aio.system.model.SysRole;
import com.mprs.aio.system.model.SysUser;
/**
 * 
 * @author Cary
 * @date 2018年8月1日
 */
@Service
public class SysMenuService  extends CrudService<SysMenuMapper, SysMenu>{
    
	
	/**
	 * 根据角色id获取权限集合
	 * @param username
	 * @return
	 */
	public List<SysMenu> loadPerByRole(String id) {
		SysRole sysRole=new SysRole();
		sysRole.setId(id);
		return mapper.loadPerByRole(sysRole);
	}
	
	/**
	 * 根据用户id获取所有权限
	 * @param id
	 * @return
	 */
	public List<SysMenu> loadPerByUser(String id) {
		SysUser sysUser=new SysUser();
		sysUser.setId(id);
		return mapper.loadPerByUser(sysUser);
	}
}