package com.mpri.aio.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.model.SysUser;

/**
 * 系统菜单管理类
 * @author Cary
 * @date 2018年8月1日
 */
@Mapper
public interface SysMenuMapper extends CrudMapper<SysMenu>{
    
	/**
	 * 根据角色获取菜单和权限
	 * @param sysRole
	 * @return
	 */
    List<SysMenu> loadPerByRole(SysRole sysRole);

    /**
     * 根据用户id 获取所有菜单
     * @param sysUser
     * @return
     */
	List<SysMenu> loadMenuByUser(SysUser sysUser);
	
	
	/**
	 * 根据用户id和菜单id获取
	 * @param id
	 * @param code
	 * @return
	 */
	public List<SysMenu> loadPagePer(SysUser sysUser);
	
	/**
	 * 根据用户id和获取权限
	 * @param id
	 * @param code
	 * @return
	 */
	public List<SysMenu> loadAllPer(SysUser sysUser);
}