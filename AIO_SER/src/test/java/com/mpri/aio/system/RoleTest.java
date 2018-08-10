package com.mpri.aio.system;


import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.service.SysRoleService;

/**
 * 角色信息测试类
 * @author Cary
 * @date 2018年8月1日
 */
public class RoleTest extends ApplicationTests {

	@Autowired
    private SysRoleService sysRoleService;
	
	
	/**
	 * 根据角色id查询权限列表 - 通过
	 */
    @Test
    public void  testloadAllListBy() {

		List<SysRole> sysRoleList=sysRoleService.loadRoleByUser("06cce4324a524e09a83d719d1564594d");
		super.outprint("java.util.List", sysRoleList);
		   
    }
    
    

}
