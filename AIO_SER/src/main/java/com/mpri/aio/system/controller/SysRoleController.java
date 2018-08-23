package com.mpri.aio.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.system.model.SysRole;
/**
 * 
* <p>Title: SysRoleController</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月18日
 */
import com.mpri.aio.system.service.SysRoleService;
@RestController
@RequestMapping("sys/sysrole")
public class SysRoleController extends BaseController {
	
	@Autowired
	private SysRoleService sysRoleService;
	
	/**
	 * 
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param sysRole
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SysRole> list(int pageNo,int pageSize,SysRole sysRole) {
		PageIo<SysRole> pageInfo =  sysRoleService.loadByPage(pageNo,pageSize,sysRole);							
		return pageInfo;
	} 
	
	/**
	 * 
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	//@Cacheable(value = "dictCache", key = "#sysDict.id")
	public SysRole get(SysRole sysRole) {
		return sysRoleService.get(sysRole);		
	}
	
	/**
	 * 
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param sysRole
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SysRole sysRole) {
		sysRoleService.deleteRoleMenu(sysRole);
		sysRoleService.delete(sysRole);
		return SUCCESS;
	}
	
	
	/**
	 * 
	* <p>Title: save</p>  
	* <p>Description: </p>  
	* @param sysRole
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@Validated SysRole sysRole){
		sysRoleService.save(sysRole);							
		return SUCCESS;
	}
	/**
	 * 
	* <p>Title: insertRoleMenu</p>  
	* <p>Description: </p>  
	* @param sysRole
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/saveRoleMenu")
	public String saveRoleMenu(@RequestBody SysRole sysRole) {
		sysRoleService.saveRoleMenu(sysRole);
		return SUCCESS;
	}
	
		
	
}
