package com.mpri.aio.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.system.model.SysOrg;
import com.mpri.aio.system.service.SysOrgService;

 /**   
 *  
 * @Description:  机构——Controller
 * @Author:       SYP
 * @project 	  AIO 
 * @CreateDate:   Fri Aug 10 15:38:06 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/sysOrg")
public class SysOrgController extends BaseController {
	
	@Autowired
	private SysOrgService sysOrgService;
		
	/**
	 * 获取机构列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param sysOrg
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SysOrg> list(int pageNo,int pageSize,SysOrg sysOrg) {
		PageIo<SysOrg> pageInfo =  sysOrgService.loadByPage(pageNo,pageSize,sysOrg);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新机构
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param sysOrg
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@Validated SysOrg sysOrg){
		sysOrgService.save(sysOrg);							
		return SUCCESS;
	}	
	
	/**
	 * 删除机构（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param sysOrg
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SysOrg sysOrg) {
		sysOrgService.delete(sysOrg);
		return SUCCESS;
	}
	
	/**
	 * 获取机构
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param sysOrg
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SysOrg get(SysOrg sysOrg) {
		return sysOrgService.get(sysOrg);
	}
	
	/**
	 * 根据条件查询所有列表数据不分页
	 * @param entity
	 * @return
	 */
	@CrossOrigin
	@GetMapping(value = "/loadAllListBy")
	public List<SysOrg> loadAllListBy(SysOrg sysOrg) {		
		return sysOrgService.loadAllListBy(sysOrg);
	}
		
}