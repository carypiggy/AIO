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
import com.mpri.aio.common.exception.ExceptionResult;
import com.mpri.aio.common.logs.Logs;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.system.model.SysDict;
import com.mpri.aio.system.service.SysDictService;

/**
 * 
* <p>Title: SysDictController</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月6日
 */
@RestController
@RequestMapping("/sys/sysdict")
public class SysDictController extends BaseController {
	
	@Autowired
	private SysDictService sysDictService;
		
	/**
	 * 获取字典列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize 
	* @param sysDict
	* @return
	 */
	@Logs(value = "编码查询",type ="QUERY")
	@CrossOrigin
	@PostMapping(value = "/list")
	public PageIo<SysDict> list(int pageNo,int pageSize,SysDict sysDict) {
		PageIo<SysDict> info = sysDictService.loadByPage(pageNo,pageSize,sysDict);	
		return info;
	}
	
	
	/**
	 * 增加或者更新字典
	* <p>Title: save</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public RestResponse<String> save(@Validated SysDict sysDict){
		sysDictService.save(sysDict);							
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "保存成功！", "");
	}	
	
	/**
	 * 删除字典（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public RestResponse<String> delete(SysDict sysDict) {
		sysDictService.delete(sysDict);
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "删除成功！", "");
	}
	
	/**
	 * 根据id获取字典
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param id
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	@RequiresAuthentication
	@RequiresPermissions("sysdict:edit")
	//@Cacheable(value = "dictCache", key = "#sysDict.id")
	public RestResponse<SysDict> get(SysDict sysDict) {
		
		return new RestResponse<SysDict>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", sysDictService.get(sysDict));

	}
	
	/**
	 * .根据编码获取字典集
	 * @param typeCode
	 * @return
	 */
	@CrossOrigin
	@PostMapping(value = "/getByTypeCode")
	public  RestResponse<List<SysDict>> getSysDictByTypecode(String typeCode) {
		return new RestResponse<List<SysDict>>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", sysDictService.getSysDictByTypecode(typeCode));
	}
		
}