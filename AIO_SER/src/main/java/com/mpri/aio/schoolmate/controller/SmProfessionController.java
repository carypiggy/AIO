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
import com.mpri.aio.schoolmate.model.SmProfession;
import com.mpri.aio.schoolmate.service.SmProfessionService;

 /**   
 *  
 * @Description:  校友管理-校友职业经历——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:57:39 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smProfession")
public class SmProfessionController extends BaseController {
	
	@Autowired
	private SmProfessionService smProfessionService;
		
	/**
	 * 获取校友管理-校友表校友经历列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smProfession
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmProfession> list(int pageNo,int pageSize,SmProfession smProfession) {
		PageIo<SmProfession> pageInfo =  smProfessionService.loadByPage(pageNo,pageSize,smProfession);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友管理-校友表校友经历
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smProfession
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@RequestBody SmProfession [] smProfession){
		for( int i=0; i<smProfession.length ; i++)
		{
		smProfessionService.save(smProfession[i]);
		}
		return SUCCESS;
	}	
	
	/**
	 * 删除校友管理-校友表校友经历（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smProfession
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmProfession smProfession) {
		smProfessionService.delete(smProfession);
		return SUCCESS;
	}
	
	/**
	 * 获取校友管理-校友表校友经历
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smProfession
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmProfession get(SmProfession smProfession) {
		return smProfessionService.get(smProfession);
	}
		
}