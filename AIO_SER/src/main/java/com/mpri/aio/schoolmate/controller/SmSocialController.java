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
import com.mpri.aio.schoolmate.model.SmSocial;
import com.mpri.aio.schoolmate.service.SmSocialService;

 /**   
 *  
 * @Description:  校友管理-校友政治兼职——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:58:47 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smSocial")
public class SmSocialController extends BaseController {
	
	@Autowired
	private SmSocialService smSocialService;
		
	/**
	 * 获取校友管理-校友政治兼职列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smSocial
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmSocial> list(int pageNo,int pageSize,SmSocial smSocial) {
		PageIo<SmSocial> pageInfo =  smSocialService.loadByPage(pageNo,pageSize,smSocial);
		
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友管理-校友政治兼职
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smSocial
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@RequestBody SmSocial [] smSocial){
		
		for( int i=0; i<smSocial.length ; i++)
		{
		smSocialService.save(smSocial[i]);			
		}
		return SUCCESS;
	}	
	
	/**
	 * 删除校友管理-校友政治兼职（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smSocial
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmSocial smSocial) {
		smSocialService.delete(smSocial);
		return SUCCESS;
	}
	
	/**
	 * 获取校友管理-校友政治兼职
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smSocial
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmSocial get(SmSocial smSocial) {
		return smSocialService.get(smSocial);
	}
		
}