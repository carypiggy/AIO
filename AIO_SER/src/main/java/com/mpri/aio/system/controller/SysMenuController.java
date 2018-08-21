package com.mpri.aio.system.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.ResJson;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.service.SysMenuService;

/**
 * 
* <p>Title: SysMenuController</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月13日
 */
@RestController
@RequestMapping("sys/sysmenu")
public class SysMenuController extends BaseController {

	@Autowired
	private SysMenuService sysMenuService;
	
	
	/**
	 * 
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param sysMenu
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public ResJson<SysMenu> list(SysMenu sysMenu) {
		ResJson<SysMenu>rj = new ResJson<SysMenu>();
		List<SysMenu> list =  sysMenuService.loadAllListBy(sysMenu);	
		rj.setData(list);
		return rj;
	}
	
	
	/**
	 * 
	* <p>Title: save</p>  
	* <p>Description: </p>  
	* @param sysMenu
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	@RequiresAuthentication
	@RequiresPermissions("sysdict:edit")
	public String save(@Validated SysMenu sysMenu){
		if("".equals(sysMenu.getParentId())|| null == sysMenu.getParentId()) {
			//setRoot 目录
		}else {
			SysMenu parentSysMenu = new SysMenu();
			parentSysMenu.setId(sysMenu.getParentId());
			parentSysMenu = sysMenuService.get(parentSysMenu);
			sysMenu.setParentIds(parentSysMenu.getParentIds()+","+parentSysMenu.getId());
		}
		sysMenuService.save(sysMenu);							
		return SUCCESS;
	}	
	
	/**
	 * 
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param sysMenu
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	@RequiresPermissions("sysdict:edit2")
	public String delete(SysMenu sysMenu) {
		sysMenuService.delete(sysMenu);
		return SUCCESS;
	}
	
	/**
	 * 
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param sysMenu
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")

	public SysMenu get(SysMenu sysMenu) {
		SysMenu resSysMenu = sysMenuService.get(sysMenu);
		SysMenu parentSysMenu = new SysMenu();
		parentSysMenu.setId(resSysMenu.getParentId());
		resSysMenu.setParentSysMenu(sysMenuService.get(parentSysMenu));
		return resSysMenu;		
	}
}
