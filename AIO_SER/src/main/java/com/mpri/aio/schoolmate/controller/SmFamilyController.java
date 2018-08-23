package com.mpri.aio.schoolmate.controller;

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
import com.mpri.aio.schoolmate.model.SmFamily;
import com.mpri.aio.schoolmate.service.SmFamilyService;

 /**   
 *  
 * @Description:  校友管理-校友家庭成员——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 11:00:06 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smFamily")
public class SmFamilyController extends BaseController {
	
	@Autowired
	private SmFamilyService smFamilyService;
		
	/**
	 * 获取校友管理-校友家庭成员列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smFamily
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmFamily> list(int pageNo,int pageSize,SmFamily smFamily) {
		PageIo<SmFamily> pageInfo =  smFamilyService.loadByPage(pageNo,pageSize,smFamily);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友管理-校友家庭成员
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smFamily
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@RequestBody SmFamily[] smFamily){
		
		for( int i=0; i<smFamily.length ; i++)
		{
		smFamilyService.save(smFamily[i]);	
		}
		return SUCCESS;
	}	
	
	/**
	 * 删除校友管理-校友家庭成员（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smFamily
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmFamily smFamily) {
		smFamilyService.delete(smFamily);
		return SUCCESS;
	}
	
	/**
	 * 获取校友管理-校友家庭成员
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smFamily
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmFamily get(SmFamily smFamily) {
		return smFamilyService.get(smFamily);
	}
		
}