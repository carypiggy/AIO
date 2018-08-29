package com.mpri.aio.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.exception.ExceptionResult;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.response.RestResponse;
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
	@PostMapping(value = "/list")
	public PageIo<SysRole> list(int pageNo,int pageSize,SysRole sysRole) {
		PageIo<SysRole> pageInfo =  sysRoleService.loadByPage(pageNo,pageSize,sysRole);							
		return pageInfo;
	} 
	
	//获取系统所有角色
	@CrossOrigin
	@PostMapping(value = "/loadAll")
	public RestResponse<List<SysRole>> loadAllBy(SysRole sysRole) {
		List<SysRole> roleList =  sysRoleService.loadAllListBy(sysRole);
		return new RestResponse<List<SysRole>>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", roleList);
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
	public RestResponse<SysRole> get(SysRole sysRole) {
		
		return new RestResponse<SysRole>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", sysRoleService.get(sysRole));

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
	public RestResponse<String> delete(SysRole sysRole) {
		sysRoleService.deleteRoleMenu(sysRole);
		sysRoleService.delete(sysRole);
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "删除成功！", "");

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
	public RestResponse<String> save(@Validated SysRole sysRole){
		sysRoleService.save(sysRole);							
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "保存成功！", "");
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
	public RestResponse<String> saveRoleMenu(@RequestBody SysRole sysRole) {
		sysRoleService.saveRoleMenu(sysRole);
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "保存成功！", "");

	}
	
		
	
}
