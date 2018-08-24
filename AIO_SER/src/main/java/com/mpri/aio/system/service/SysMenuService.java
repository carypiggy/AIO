package com.mpri.aio.system.service;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpri.aio.base.service.CrudService;
import com.mpri.aio.system.mapper.SysMenuMapper;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.model.SysUser;
/**
 * 
 * @author Cary
 * @date 2018年8月1日
 */
@Service

public class SysMenuService  extends CrudService<SysMenuMapper, SysMenu>{
    
	
	/**
	 * 根据角色id获取角色集合
	 * @param username
	 * @return
	 */
	
	public List<SysMenu> loadPerByRole(String id) {
		SysRole sysRole=new SysRole();
		sysRole.setId(id);
		return mapper.loadPerByRole(sysRole);
	}
	
	/**
	 * 根据用户id获取所有菜单
	 * @param id
	 * @return
	 */
	@Cacheable(value = "menuCache", key = "#id")
	public List<SysMenu> loadMenuByUser(String id) {
		SysUser sysUser=new SysUser();
		sysUser.setId(id);
		return mapper.loadMenuByUser(sysUser);
	}
	
	/**
	 * 根据用户id和菜单id获取当前菜单权限
	 * @param id
	 * @return
	 */
	@Cacheable(value = "pagePerCache", key = "#id+#menuId")
	public List<SysMenu> loadPagePer(String id,String menuId) {
		SysUser sysUser=new SysUser();
		sysUser.setId(id);
		sysUser.setParamA(menuId);//临时借用查询参数，实际为页面编码
		return mapper.loadPagePer (sysUser);
	}
	
	/**
	 * 根据用户id获取用户所有权限
	 * @param id
	 * @return
	 */
	@Cacheable(value = "perCache", key ="#id")
	public List<SysMenu> loadAllPer(String id) {
		SysUser sysUser=new SysUser();
		sysUser.setId(id);
		return mapper.loadAllPer(sysUser);
	}
	
	
	
}