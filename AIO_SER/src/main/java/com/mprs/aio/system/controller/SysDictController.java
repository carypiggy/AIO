package com.mprs.aio.system.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageInfo;
import com.mprs.aio.base.controller.BaseController;
import com.mprs.aio.common.page.PageIo;
import com.mprs.aio.system.model.SysDict;
import com.mprs.aio.system.service.SysDictService;

/**
 * 
* <p>Title: SysDictController</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月6日
 */
@Controller
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
	* @return
	 */
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public PageInfo<SysDict> list(int pageNo,int pageSize,SysDict sysDict) {
		PageIo<SysDict> pageInfo =  sysDictService.loadByPage(pageNo,pageSize,sysDict);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新字典
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @return
	 */
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String save(SysDict sysDict) {
		sysDictService.save(sysDict);							
		return "success";
	}	
	
	/**
	 * 删除字典（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(SysDict sysDict) {
		sysDictService.delete(sysDict);
		return "success";
	}
		
}












