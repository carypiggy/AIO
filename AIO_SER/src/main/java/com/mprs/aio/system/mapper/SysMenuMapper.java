package com.mprs.aio.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mprs.aio.base.mapper.CrudMapper;
import com.mprs.aio.system.model.SysMenu;
import com.mprs.aio.system.model.SysRole;
import com.mprs.aio.system.model.SysUser;

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
     * 根据用户id 获取所有权限和菜单
     * @param sysUser
     * @return
     */
	List<SysMenu> loadPerByUser(SysUser sysUser);
}