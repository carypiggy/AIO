package com.mpri.aio.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.model.SysUser;
/**
 * 角色信息Mapper
 * @author Cary
 * @Date  2018年7月31日
 */
@Mapper
public interface SysRoleMapper extends CrudMapper<SysRole>{

	/**
	 * 根据用户获取角色列表
	 * @param sysUser
	 * @return
	 */
	List<SysRole> loadRoleByUser(SysUser sysUser);
	
	/**
	 *  
	* <p>Title: insertRoleMenu</p>  
	* <p>Description: </p>  
	* @param sysRole
	 */
	void insertRoleMenu (SysRole sysRole);
	
	
	/**
	 * 删除角色和菜单菜单关系
	* <p>Title: deleteRoleMenu</p>  
	* <p>Description: </p>  
	* @param sysRole
	 */
	void deleteRoleMenu (SysRole sysRole);
    
}