package com.mpri.aio.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.exception.ExceptionResult;
import com.mpri.aio.common.logs.Logs;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.page.ResJson;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.system.model.SysArea;
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
	@PostMapping("tree")
	public ResJson<SysArea> tree(SysArea sysDict) {
		ResJson<SysArea> rj = new ResJson<SysArea>();
		List<SysArea> list =  sysAreaService.loadAllListBy(sysDict);	
		rj.setData(list);
		return rj;
	}
	
	
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
	@PostMapping("list")
	public PageIo<SysArea> list(int pageNo,int pageSize,SysArea sysDict) {
		PageIo<SysArea> info = sysAreaService.loadByPage(pageNo,pageSize,sysDict);	
		return info;
	}
	
	
	/**
	 * 
	 * <p>Title: save</p>  
	 * <p>Description: </p>  
	 * @param sysDict
	 * @return
	 */
	@Logs(value = "区域修改",type ="UPDATE")
	@CrossOrigin
	@PostMapping("save")
	public RestResponse<String> save(@Validated SysArea sysArea){
		if("Root".equals(sysArea.getParentId())|| null == sysArea.getParentId()) {
			//setRoot 目录
		}else {
			SysArea parentSysArea = new SysArea();
			parentSysArea.setId(sysArea.getParentId());
			parentSysArea = sysAreaService.get(parentSysArea);
			sysArea.setParentIds(parentSysArea.getParentIds()+","+parentSysArea.getId());
		}
		sysAreaService.save(sysArea);
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "保存成功！", "");
		
	}	
	
	/* 
	 * <p>Title: delete</p>  
	 * <p>Description: </p>  
	 * @param sysDict
	 * @return
	 */
	@Logs(value = "区域删除",type ="DELETE")
	@CrossOrigin
	@PostMapping("delete")
	public RestResponse<String> delete(SysArea sysArea) {
		sysAreaService.delete(sysArea);
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "删除成功！", "");

	}
	

	/**
	 * 
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping("get")
	//@Cacheable(value = "dictCache", key = "#sysDict.id")
	public RestResponse<SysArea> get(SysArea sysArea) {
		
		SysArea resSysArea = sysAreaService.get(sysArea);
		SysArea parentSysArea = new SysArea();
		parentSysArea.setId(resSysArea.getParentId());
		resSysArea.setParentSysArea(sysAreaService.get(parentSysArea));
		
		return new RestResponse<SysArea>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", resSysArea);
	
	}
	
	/**
	 * 
	 * <p>Title: POST</p>  
	 * <p>Description: </p>  
	 * @param sysDict
	 * @return
	 */
	@CrossOrigin
	@PostMapping("loadChildrenByParent")
	//@Cacheable(value = "dictCache", key = "#sysDict.id")
	public RestResponse<List<SysArea>> loadChildrenByParent(SysArea sysArea) {
		
		return new RestResponse<List<SysArea>>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", sysAreaService.loadChildrenByParent(sysArea));

	}
	
	/**
	 * 
	 * <p>Title: POST</p>  
	 * <p>Description: </p>  
	 * @param sysDict
	 * @return
	 */
	@CrossOrigin
	@PostMapping("loadAllListBy")
	public RestResponse<List<SysArea>> loadAllListBy(SysArea sysArea) {
		return new RestResponse<List<SysArea>>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", sysAreaService.loadAllListBy(sysArea));
	}
}