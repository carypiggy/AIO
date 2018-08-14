package com.mpri.aio.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
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
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SysDict> list(int pageNo,int pageSize,SysDict sysDict) {
		PageIo<SysDict> pageInfo =  sysDictService.loadByPage(pageNo,pageSize,sysDict);							
		return pageInfo;
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
	public String save(@Validated SysDict sysDict){
		sysDictService.save(sysDict);							
		return SUCCESS;
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
	public String delete(SysDict sysDict) {
		sysDictService.delete(sysDict);
		return SUCCESS;
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
	@Cacheable(value = "dictCache", key = "#sysDict.id",cacheManager="caffeineCacheManager")
	public SysDict get(SysDict sysDict) {
		return sysDictService.get(sysDict);		
	}
		
}