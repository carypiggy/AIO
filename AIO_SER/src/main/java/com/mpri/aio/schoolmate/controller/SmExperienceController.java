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
import com.mpri.aio.schoolmate.model.SmExperience;
import com.mpri.aio.schoolmate.service.SmExperienceService;

 /**   
 *  
 * @Description:  校友管理-校友表校园经历——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:56:04 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smExperience")
public class SmExperienceController extends BaseController {
	
	@Autowired
	private SmExperienceService smExperienceService;
		
	/**
	 * 获取校友管理-校友表校园经历列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smExperience
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmExperience> list(int pageNo,int pageSize,SmExperience smExperience) {
		PageIo<SmExperience> pageInfo =  smExperienceService.loadByPage(pageNo,pageSize,smExperience);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友管理-校友表校友经历
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smExperience
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@RequestBody SmExperience [] smExperience){
		
		for( int i=0; i<smExperience.length ; i++)
		{
			smExperienceService.save(smExperience[i]);
		}
		return SUCCESS;
	}	
	
	/**
	 * 删除校友管理-校友表校友经历（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smExperience
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmExperience smExperience) {
		smExperienceService.delete(smExperience);
		return SUCCESS;
	}
	
	/**
	 * 获取校友管理-校友表校友经历
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smExperience
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmExperience get(SmExperience smExperience) {
		return smExperienceService.get(smExperience);
	}
		
}