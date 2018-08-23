package com.mpri.aio.system;


import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.service.SysMenuService;

/**
 * 菜单权限测试类
 * @author Cary
 * @date 2018年8月1日
 */
public class MenuTest extends ApplicationTests {

	@Autowired
    private SysMenuService sysMenuService;
	
	
	/**
	 * 根据用户id查询权限列表 - 通过
	 */
    @Test
    public void  testLoadAllPer() {
		List<SysMenu> list=sysMenuService.loadAllPer("0e207e95eb9d4f3985120ec7d5528013");
		super.outprint("java.util.List", list);
		   
    }
	
	
	/**
	 * 根据角色id查询权限列表 - 通过
	 */
    //@Test
    public void  testLoadPerByRole() {
		List<SysMenu> sysUserList=sysMenuService.loadPerByRole("1");
		super.outprint("java.util.List", sysUserList);
		   
    }
    /**
	 * 根据用户id查询菜单列表 - 通过
	 */
    //@Test
    public void  testLoadPerByUser() {
		List<SysMenu> list=sysMenuService.loadMenuByUser("0e207e95eb9d4f3985120ec7d5528013");
		super.outprint("java.util.List", list);
		   
    }
    
    //@Test
    public void testLoadAllListBy() {
    	List<SysMenu> list = sysMenuService.loadAllListBy(new SysMenu());
    	super.outprint("java.util.List", list);
    }
    
    @Test
    public void testLoadPagePer() {
    	List<SysMenu> list = sysMenuService.loadPagePer("0e207e95eb9d4f3985120ec7d5528013","6002");
    	super.outprint("java.util.List", list);
    }
    
}
