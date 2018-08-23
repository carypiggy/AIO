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
import com.mpri.aio.schoolmate.model.SmEducation;
import com.mpri.aio.schoolmate.service.SmEducationService;

 /**   
 *  
 * @Description:  校友管理-教育经历——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:53:23 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smEducation")
public class SmEducationController extends BaseController {
	
	@Autowired
	private SmEducationService smEducationService;
		
	/**
	 * 获取校友管理-校友表列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smEducation
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmEducation> list(int pageNo,int pageSize,SmEducation smEducation) {
		PageIo<SmEducation> pageInfo =  smEducationService.loadByPage(pageNo,pageSize,smEducation);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友管理-校友表
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smEducation
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@RequestBody SmEducation [] smEducation){
		for( int i=0; i<smEducation.length ; i++)
		{
			smEducationService.save(smEducation[i]);
		}
									
		return SUCCESS;
	}	
	
	/**
	 * 删除校友管理-校友表（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smEducation
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmEducation smEducation) {
		smEducationService.delete(smEducation);
		return SUCCESS;
	}
	
	/**
	 * 获取校友管理-校友表
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smEducation
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmEducation get(SmEducation smEducation) {
		return smEducationService.get(smEducation);
	}
		
}