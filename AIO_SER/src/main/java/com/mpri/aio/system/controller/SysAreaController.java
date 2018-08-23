package com.mpri.aio.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.ResJson;
import com.mpri.aio.system.model.SysArea;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.service.SysAreaService;

/**
 * 区域管理Controller
* <p>Title: SysAreaController</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月18日
 */
@RestController
@RequestMapping("sys/sysarea")
public class SysAreaController extends BaseController {
	
	@Autowired
	private SysAreaService sysAreaService;
	
	/**
	 * 
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public ResJson<SysArea> list(SysArea sysDict) {
		ResJson<SysArea>rj = new ResJson<SysArea>();
		List<SysArea> list =  sysAreaService.loadAllListBy(sysDict);	
		rj.setData(list);
		return rj;
	}
	
	
	/**
	 * 
	* <p>Title: save</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@Validated SysArea sysArea){
		if("Root".equals(sysArea.getParentId())|| null == sysArea.getParentId()) {
			//setRoot 目录
		}else {
			SysArea parentSysArea = new SysArea();
			parentSysArea.setId(sysArea.getParentId());
			parentSysArea = sysAreaService.get(parentSysArea);
			sysArea.setParentIds(parentSysArea.getParentIds()+","+parentSysArea.getId());
		}
		sysAreaService.save(sysArea);							
		return SUCCESS;
	}	
	
	/**\
	 * 
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SysArea sysArea) {
		sysAreaService.delete(sysArea);
		return SUCCESS;
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
	public SysArea get(SysArea sysArea) {
		SysArea resSysArea = sysAreaService.get(sysArea);
		SysArea parentSysArea = new SysArea();
		parentSysArea.setId(resSysArea.getParentId());
		resSysArea.setParentSysArea(sysAreaService.get(parentSysArea));
		return resSysArea;		
	}
	
	/**
	 * 
	* <p>Title: POST</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/loadChildrenByParent")
	//@Cacheable(value = "dictCache", key = "#sysDict.id")
	public List<SysArea> loadChildrenByParent(SysArea sysArea) {
		return sysAreaService.loadChildrenByParent(sysArea);
	}
	
	/**
	 * 
	* <p>Title: POST</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/loadAllListBy")
	//@Cacheable(value = "dictCache", key = "#sysDict.id")
	public List<SysArea> loadAllListBy(SysArea sysArea) {
		return sysAreaService.loadAllListBy(sysArea);
	}
}
