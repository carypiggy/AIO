package com.mpri.aio.pf;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.service.SysMenuService;
import com.mpri.aio.system.service.SysRoleService;

public class InitRoleAndPerData extends ApplicationTests{

	@Autowired
	SysRoleService sysRoleService;
	
	@Autowired
	SysMenuService sysMenuService;
	
	//@Test
	public void initRole() {
		//新增角色
		SysRole sysRole=new SysRole();
		sysRole.setCode("admin");
		sysRole.setName("系统管理员");
		sysRole.setType("ADMIN");
		//sysRole.setMenuList(menuList);
		sysRoleService.save(sysRole);
		
		
	}

	
	@Test
	public void initRolePer() {
		//获取所有菜单权限
		SysMenu entity= new SysMenu();
		List<SysMenu> menuList=sysMenuService.loadAllListBy(entity);	
		
		//新增角色
		SysRole roleEntity=new SysRole();
		roleEntity.setId("397c3cb5cfbe4da49bd97db3b9f9a28a");
		SysRole sysRole=sysRoleService.get(roleEntity);
		sysRole.setMenuList(menuList);
		sysRoleService.saveRoleMenu(sysRole);
	}
	
	
}
