package com.mprs.aio.system;


import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mprs.aio.ApplicationTests;
import com.mprs.aio.system.model.SysMenu;
import com.mprs.aio.system.service.SysMenuService;

/**
 * 菜单权限测试类
 * @author Cary
 * @date 2018年8月1日
 */
public class MenuTest extends ApplicationTests {

	@Autowired
    private SysMenuService sysMenuService;
	
	
	/**
	 * 根据角色id查询权限列表 - 通过
	 */
    @Test
    public void  testLoadPerByRole() {
		List<SysMenu> sysUserList=sysMenuService.loadPerByRole("1");
		super.outprint("java.util.List", sysUserList);
		   
    }
    
    

}
