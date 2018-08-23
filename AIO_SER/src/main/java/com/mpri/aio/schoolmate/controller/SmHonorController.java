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
import com.mpri.aio.schoolmate.model.SmHonor;
import com.mpri.aio.schoolmate.service.SmHonorService;

 /**   
 *  
 * @Description:  校友管理-荣誉——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 11:04:56 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smHonor")
public class SmHonorController extends BaseController {
	
	@Autowired
	private SmHonorService smHonorService;
		
	/**
	 * 获取校友管理-荣誉列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smHonor
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmHonor> list(int pageNo,int pageSize,SmHonor smHonor) {
		PageIo<SmHonor> pageInfo =  smHonorService.loadByPage(pageNo,pageSize,smHonor);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友管理-荣誉
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smHonor
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@RequestBody SmHonor [] smHonor){
		
		for( int i=0; i<smHonor.length ; i++)
		{
		smHonorService.save(smHonor[i]);
		}
		return SUCCESS;
	}	
	
	/**
	 * 删除校友管理-荣誉（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smHonor
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmHonor smHonor) {
		smHonorService.delete(smHonor);
		return SUCCESS;
	}
	
	/**
	 * 获取校友管理-荣誉
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smHonor
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmHonor get(SmHonor smHonor) {
		return smHonorService.get(smHonor);
	}
		
}