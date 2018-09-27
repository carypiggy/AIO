package com.mpri.aio.pf;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.service.SysMenuService;

/**
 * 初始化菜单
 * @author Cary
 * @date 2018年9月27日
 */
public class InitMenuData extends ApplicationTests{
	
	@Autowired
	SysMenuService sysMenuService;
	
	//@Test
	public void initMenuRoot() {
		//根节点
		SysMenu root = new SysMenu();
		root.setParentId("root");
		root.setParentIds("root");
		root.setName("XXX系统");
		root.setCode("aio");
		root.setHref("");
		root.setIcon("");
		root.setType("MENU");
		root.setPermission("aio");
		root.setOperate("");
		root.setSort(0L);
		root.setTarget("");
		root.setIsShow("SHOW");
		sysMenuService.save(root);
	}
	
	//@Test
	public void initMenuSys() {
		//系统节点
		SysMenu sys = new SysMenu();
		sys.setParentId("d6c29be2265c4a05a8b00b105cf7c424");
		sys.setParentIds("d6c29be2265c4a05a8b00b105cf7c424");
		sys.setName("系统");
		sys.setCode("system");
		sys.setHref("");
		sys.setIcon("");
		sys.setType("MENU");
		sys.setPermission("system");
		sys.setOperate("");
		sys.setSort(9000L);
		sys.setTarget("");
		sys.setIsShow("SHOW");
		sysMenuService.save(sys);
	}
	
	//@Test
	public void initMenuSysMenu() {
		//1用户管理
		SysMenu sysuser = new SysMenu();
		sysuser.setParentId("105c8d5f492a440d93da7afd29994966");
		sysuser.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966");
		sysuser.setName("用户管理");
		sysuser.setCode("sys_user");
		sysuser.setHref("views/module/system/user/userList.html");
		sysuser.setIcon("layui-icon-user");
		sysuser.setType("MENU");
		sysuser.setPermission("sys:user");
		sysuser.setOperate("");
		sysuser.setSort(90100L);
		sysuser.setTarget("");
		sysuser.setIsShow("SHOW");
		
		//2角色管理
		SysMenu sysrole = new SysMenu();
		sysrole.setParentId("105c8d5f492a440d93da7afd29994966");
		sysrole.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966");
		sysrole.setName("角色管理");
		sysrole.setCode("sys_role");
		sysrole.setHref("views/module/system/role/roleList.html");
		sysrole.setIcon("layui-icon-username");
		sysrole.setType("MENU");
		sysrole.setPermission("sys:role");
		sysrole.setOperate("");
		sysrole.setSort(90200L);
		sysrole.setTarget("");
		sysrole.setIsShow("SHOW");
		
		//3组织机构管理
		SysMenu sysorg = new SysMenu();
		sysorg.setParentId("105c8d5f492a440d93da7afd29994966");
		sysorg.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966");
		sysorg.setName("机构管理");
		sysorg.setCode("sys_org");
		sysorg.setHref("views/module/system/org/orgList.html");
		sysorg.setIcon("layui-icon-tree");
		sysorg.setType("MENU");
		sysorg.setPermission("sys:org");
		sysorg.setOperate("");
		sysorg.setSort(90300L);
		sysorg.setTarget("");
		sysorg.setIsShow("SHOW");
		
		//4菜单管理
		SysMenu sysmenu = new SysMenu();
		sysmenu.setParentId("105c8d5f492a440d93da7afd29994966");
		sysmenu.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966");
		sysmenu.setName("菜单管理");
		sysmenu.setCode("sys_menu");
		sysmenu.setHref("views/module/system/menu/menuList.html");
		sysmenu.setIcon("layui-icon-list");
		sysmenu.setType("MENU");
		sysmenu.setPermission("sys:menu");
		sysmenu.setOperate("");
		sysmenu.setSort(90400L);
		sysmenu.setTarget("");
		sysmenu.setIsShow("SHOW");
		
		//5字典管理
		SysMenu sysdict = new SysMenu();
		sysdict.setParentId("105c8d5f492a440d93da7afd29994966");
		sysdict.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966");
		sysdict.setName("字典管理");
		sysdict.setCode("sys_dict");
		sysdict.setHref("views/module/system/dict/dictList.html");
		sysdict.setIcon("layui-icon-read");
		sysdict.setType("MENU");
		sysdict.setPermission("sys:dict");
		sysdict.setOperate("");
		sysdict.setSort(90500L);
		sysdict.setTarget("");
		sysdict.setIsShow("SHOW");
		
		//6区域管理
		SysMenu sysarea = new SysMenu();
		sysarea.setParentId("105c8d5f492a440d93da7afd29994966");
		sysarea.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966");
		sysarea.setName("区域管理");
		sysarea.setCode("sys_area");
		sysarea.setHref("views/module/system/area/areaList.html");
		sysarea.setIcon("layui-icon-website");
		sysarea.setType("MENU");
		sysarea.setPermission("sys:area");
		sysarea.setOperate("");
		sysarea.setSort(90600L);
		sysarea.setTarget("");
		sysarea.setIsShow("SHOW");
		
		//7日志管理
		SysMenu syslogs = new SysMenu();
		syslogs.setParentId("105c8d5f492a440d93da7afd29994966");
		syslogs.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966");
		syslogs.setName("日志管理");
		syslogs.setCode("sys_logs");
		syslogs.setHref("views/module/system/logs/logsList.html");
		syslogs.setIcon("layui-icon-survey");
		syslogs.setType("MENU");
		syslogs.setPermission("sys:logs");
		syslogs.setOperate("");
		syslogs.setSort(90700L);
		syslogs.setTarget("");
		syslogs.setIsShow("SHOW");
		
		sysMenuService.save(sysuser);
		sysMenuService.save(sysrole);
		sysMenuService.save(sysorg);
		sysMenuService.save(sysmenu);
		sysMenuService.save(sysdict);
		sysMenuService.save(sysarea);
		sysMenuService.save(syslogs);
	}
	
	@Test
	public void initMenuSysMenuPer() {
		//1用户管理
		SysMenu sysuser_add = new SysMenu();
		sysuser_add.setParentId("a28e6ca9332b45b3ad5f744cbe1432c4");
		sysuser_add.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,a28e6ca9332b45b3ad5f744cbe1432c4");
		sysuser_add.setName("新增");
		sysuser_add.setCode("sys_user_add");
		sysuser_add.setHref("");
		sysuser_add.setIcon("layui-icon-add-1");
		sysuser_add.setType("PERMISSION");
		sysuser_add.setPermission("sys:user:add");
		sysuser_add.setOperate("ADD");
		sysuser_add.setSort(90101L);
		sysuser_add.setTarget("");
		sysuser_add.setIsShow("SHOW");
		sysMenuService.save(sysuser_add);
		
		
		SysMenu sysuser_edit = new SysMenu();
		sysuser_edit.setParentId("a28e6ca9332b45b3ad5f744cbe1432c4");
		sysuser_edit.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,a28e6ca9332b45b3ad5f744cbe1432c4");
		sysuser_edit.setName("编辑");
		sysuser_edit.setCode("sys_user_edit");
		sysuser_edit.setHref("");
		sysuser_edit.setIcon("layui-icon-edit");
		sysuser_edit.setType("PERMISSION");
		sysuser_edit.setPermission("sys:user:edit");
		sysuser_edit.setOperate("EDIT");
		sysuser_edit.setSort(90102L);
		sysuser_edit.setTarget("");
		sysuser_edit.setIsShow("SHOW");
		sysMenuService.save(sysuser_edit);
		
		SysMenu sysuser_del = new SysMenu();
		sysuser_del.setParentId("a28e6ca9332b45b3ad5f744cbe1432c4");
		sysuser_del.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,a28e6ca9332b45b3ad5f744cbe1432c4");
		sysuser_del.setName("删除");
		sysuser_del.setCode("sys_user_del");
		sysuser_del.setHref("");
		sysuser_del.setIcon("layui-icon-delete");
		sysuser_del.setType("PERMISSION");
		sysuser_del.setPermission("sys:user:del");
		sysuser_del.setOperate("DEL");
		sysuser_del.setSort(90103L);
		sysuser_del.setTarget("");
		sysuser_del.setIsShow("SHOW");
		sysMenuService.save(sysuser_del);
		
		//2角色管理
		SysMenu sysrole_add = new SysMenu();
		sysrole_add.setParentId("6506dee426074b3fb43ede08996ae851");
		sysrole_add.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,6506dee426074b3fb43ede08996ae851");
		sysrole_add.setName("新增");
		sysrole_add.setCode("sys_role_add");
		sysrole_add.setHref("");
		sysrole_add.setIcon("layui-icon-add-1");
		sysrole_add.setType("PERMISSION");
		sysrole_add.setPermission("sys:role:add");
		sysrole_add.setOperate("ADD");
		sysrole_add.setSort(90201L);
		sysrole_add.setTarget("");
		sysrole_add.setIsShow("SHOW");
		sysMenuService.save(sysrole_add);
		
		SysMenu sysrole_edit = new SysMenu();
		sysrole_edit.setParentId("6506dee426074b3fb43ede08996ae851");
		sysrole_edit.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,6506dee426074b3fb43ede08996ae851");
		sysrole_edit.setName("编辑");
		sysrole_edit.setCode("sys_role_edit");
		sysrole_edit.setHref("");
		sysrole_edit.setIcon("layui-icon-edit");
		sysrole_edit.setType("PERMISSION");
		sysrole_edit.setPermission("sys:role:edit");
		sysrole_edit.setOperate("EDIT");
		sysrole_edit.setSort(90202L);
		sysrole_edit.setTarget("");
		sysrole_edit.setIsShow("SHOW");
		sysMenuService.save(sysrole_edit);
		
		SysMenu sysrole_del = new SysMenu();
		sysrole_del.setParentId("6506dee426074b3fb43ede08996ae851");
		sysrole_del.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,6506dee426074b3fb43ede08996ae851");
		sysrole_del.setName("删除");
		sysrole_del.setCode("sys_role_del");
		sysrole_del.setHref("");
		sysrole_del.setIcon("layui-icon-delete");
		sysrole_del.setType("PERMISSION");
		sysrole_del.setPermission("sys:role:del");
		sysrole_del.setOperate("DEL");
		sysrole_del.setSort(90203L);
		sysrole_del.setTarget("");
		sysrole_del.setIsShow("SHOW");
		sysMenuService.save(sysrole_del);
		
		SysMenu sysuser_perm = new SysMenu();
		sysuser_perm.setParentId("6506dee426074b3fb43ede08996ae851");
		sysuser_perm.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,6506dee426074b3fb43ede08996ae851");
		sysuser_perm.setName("删除");
		sysuser_perm.setCode("sys_role_perm");
		sysuser_perm.setHref("");
		sysuser_perm.setIcon("layui-icon-auz");
		sysuser_perm.setType("PERMISSION");
		sysuser_perm.setPermission("sys:role:perm");
		sysuser_perm.setOperate("PERM");
		sysuser_perm.setSort(90204L);
		sysuser_perm.setTarget("");
		sysuser_perm.setIsShow("SHOW");
		sysMenuService.save(sysuser_perm);
		
		//3组织机构管理
		SysMenu sysorg_add = new SysMenu();
		sysorg_add.setParentId("1fc72610a25f462dabc47c01ced5272f");
		sysorg_add.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,1fc72610a25f462dabc47c01ced5272f");
		sysorg_add.setName("新增");
		sysorg_add.setCode("sys_org_add");
		sysorg_add.setHref("");
		sysorg_add.setIcon("layui-icon-add-1");
		sysorg_add.setType("PERMISSION");
		sysorg_add.setPermission("sys:org:add");
		sysorg_add.setOperate("ADD");
		sysorg_add.setSort(90301L);
		sysorg_add.setTarget("");
		sysorg_add.setIsShow("SHOW");
		sysMenuService.save(sysorg_add);
		
		SysMenu sysorg_edit = new SysMenu();
		sysorg_edit.setParentId("1fc72610a25f462dabc47c01ced5272f");
		sysorg_edit.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,1fc72610a25f462dabc47c01ced5272f");
		sysorg_edit.setName("编辑");
		sysorg_edit.setCode("sys_org_edit");
		sysorg_edit.setHref("");
		sysorg_edit.setIcon("layui-icon-edit");
		sysorg_edit.setType("PERMISSION");
		sysorg_edit.setPermission("sys:org:edit");
		sysorg_edit.setOperate("EDIT");
		sysorg_edit.setSort(90302L);
		sysorg_edit.setTarget("");
		sysorg_edit.setIsShow("SHOW");
		sysMenuService.save(sysorg_edit);
		
		SysMenu sysorg_del = new SysMenu();
		sysorg_del.setParentId("1fc72610a25f462dabc47c01ced5272f");
		sysorg_del.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,1fc72610a25f462dabc47c01ced5272f");
		sysorg_del.setName("删除");
		sysorg_del.setCode("sys_org_del");
		sysorg_del.setHref("");
		sysorg_del.setIcon("layui-icon-delete");
		sysorg_del.setType("PERMISSION");
		sysorg_del.setPermission("sys:org:del");
		sysorg_del.setOperate("DEL");
		sysorg_del.setSort(90303L);
		sysorg_del.setTarget("");
		sysorg_del.setIsShow("SHOW");
		sysMenuService.save(sysorg_del);
	
		
		//4菜单管理
		SysMenu sysmenu_add = new SysMenu();
		sysmenu_add.setParentId("4f65f6dd22e1478b95a066ac600b1a4a");
		sysmenu_add.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,4f65f6dd22e1478b95a066ac600b1a4a");
		sysmenu_add.setName("新增");
		sysmenu_add.setCode("sys_menu_add");
		sysmenu_add.setHref("");
		sysmenu_add.setIcon("layui-icon-add-1");
		sysmenu_add.setType("PERMISSION");
		sysmenu_add.setPermission("sys:menu:add");
		sysmenu_add.setOperate("ADD");
		sysmenu_add.setSort(90401L);
		sysmenu_add.setTarget("");
		sysmenu_add.setIsShow("SHOW");
		sysMenuService.save(sysmenu_add);
		
		SysMenu sysmenu_edit = new SysMenu();
		sysmenu_edit.setParentId("4f65f6dd22e1478b95a066ac600b1a4a");
		sysmenu_edit.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,4f65f6dd22e1478b95a066ac600b1a4a");
		sysmenu_edit.setName("编辑");
		sysmenu_edit.setCode("sys_menu_edit");
		sysmenu_edit.setHref("");
		sysmenu_edit.setIcon("layui-icon-edit");
		sysmenu_edit.setType("PERMISSION");
		sysmenu_edit.setPermission("sys:menu:edit");
		sysmenu_edit.setOperate("EDIT");
		sysmenu_edit.setSort(90402L);
		sysmenu_edit.setTarget("");
		sysmenu_edit.setIsShow("SHOW");
		sysMenuService.save(sysmenu_edit);
		
		SysMenu sysmenu_del = new SysMenu();
		sysmenu_del.setParentId("4f65f6dd22e1478b95a066ac600b1a4a");
		sysmenu_del.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,4f65f6dd22e1478b95a066ac600b1a4a");
		sysmenu_del.setName("删除");
		sysmenu_del.setCode("sys_menu_del");
		sysmenu_del.setHref("");
		sysmenu_del.setIcon("layui-icon-delete");
		sysmenu_del.setType("PERMISSION");
		sysmenu_del.setPermission("sys:menu:del");
		sysmenu_del.setOperate("DEL");
		sysmenu_del.setSort(90403L);
		sysmenu_del.setTarget("");
		sysmenu_del.setIsShow("SHOW");
		sysMenuService.save(sysmenu_del);
		
		//5字典管理
		SysMenu sysdict_add = new SysMenu();
		sysdict_add.setParentId("639c64f13fc34a98aa0eee224afe2735");
		sysdict_add.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,639c64f13fc34a98aa0eee224afe2735");
		sysdict_add.setName("新增");
		sysdict_add.setCode("sys_dict_add");
		sysdict_add.setHref("");
		sysdict_add.setIcon("layui-icon-add-1");
		sysdict_add.setType("PERMISSION");
		sysdict_add.setPermission("sys:dict:add");
		sysdict_add.setOperate("ADD");
		sysdict_add.setSort(90501L);
		sysdict_add.setTarget("");
		sysdict_add.setIsShow("SHOW");
		sysMenuService.save(sysdict_add);
		
		SysMenu sysdict_edit = new SysMenu();
		sysdict_edit.setParentId("639c64f13fc34a98aa0eee224afe2735");
		sysdict_edit.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,639c64f13fc34a98aa0eee224afe2735");
		sysdict_edit.setName("编辑");
		sysdict_edit.setCode("sys_dict_edit");
		sysdict_edit.setHref("");
		sysdict_edit.setIcon("layui-icon-edit");
		sysdict_edit.setType("PERMISSION");
		sysdict_edit.setPermission("sys:dict:edit");
		sysdict_edit.setOperate("EDIT");
		sysdict_edit.setSort(90502L);
		sysdict_edit.setTarget("");
		sysdict_edit.setIsShow("SHOW");
		sysMenuService.save(sysdict_edit);
		
		SysMenu sysdict_del = new SysMenu();
		sysdict_del.setParentId("639c64f13fc34a98aa0eee224afe2735");
		sysdict_del.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,639c64f13fc34a98aa0eee224afe2735");
		sysdict_del.setName("删除");
		sysdict_del.setCode("sys_dict_del");
		sysdict_del.setHref("");
		sysdict_del.setIcon("layui-icon-delete");
		sysdict_del.setType("PERMISSION");
		sysdict_del.setPermission("sys:dict:del");
		sysdict_del.setOperate("DEL");
		sysdict_del.setSort(90503L);
		sysdict_del.setTarget("");
		sysdict_del.setIsShow("SHOW");
		sysMenuService.save(sysdict_del);
		
		//6区域管理		
		SysMenu sysarea_add = new SysMenu();
		sysarea_add.setParentId("05648d4088694839a70f1bfaf98edac6");
		sysarea_add.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,05648d4088694839a70f1bfaf98edac6");
		sysarea_add.setName("新增");
		sysarea_add.setCode("sys_area_add");
		sysarea_add.setHref("");
		sysarea_add.setIcon("layui-icon-add-1");
		sysarea_add.setType("PERMISSION");
		sysarea_add.setPermission("sys:area:add");
		sysarea_add.setOperate("ADD");
		sysarea_add.setSort(90601L);
		sysarea_add.setTarget("");
		sysarea_add.setIsShow("SHOW");
		sysMenuService.save(sysarea_add);
		
		SysMenu sysarea_edit = new SysMenu();
		sysarea_edit.setParentId("05648d4088694839a70f1bfaf98edac6");
		sysarea_edit.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,05648d4088694839a70f1bfaf98edac6");
		sysarea_edit.setName("编辑");
		sysarea_edit.setCode("sys_area_edit");
		sysarea_edit.setHref("");
		sysarea_edit.setIcon("layui-icon-edit");
		sysarea_edit.setType("PERMISSION");
		sysarea_edit.setPermission("sys:area:edit");
		sysarea_edit.setOperate("EDIT");
		sysarea_edit.setSort(90602L);
		sysarea_edit.setTarget("");
		sysarea_edit.setIsShow("SHOW");
		sysMenuService.save(sysarea_edit);
		
		SysMenu sysarea_del = new SysMenu();
		sysarea_del.setParentId("05648d4088694839a70f1bfaf98edac6");
		sysarea_del.setParentIds("d6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,05648d4088694839a70f1bfaf98edac6");
		sysarea_del.setName("删除");
		sysarea_del.setCode("sys_area_del");
		sysarea_del.setHref("");
		sysarea_del.setIcon("layui-icon-delete");
		sysarea_del.setType("PERMISSION");
		sysarea_del.setPermission("sys:area:del");
		sysarea_del.setOperate("DEL");
		sysarea_del.setSort(90603L);
		sysarea_del.setTarget("");
		sysarea_del.setIsShow("SHOW");
		sysMenuService.save(sysarea_del);
		
		//7日志管理
		
		
		
		
	}
	
}
