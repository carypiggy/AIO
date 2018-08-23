package com.mpri.aio.schoolmate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageInfo;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.schoolmate.model.SmCardDetails;
import com.mpri.aio.schoolmate.service.SmCardDetailsService;

 /**   
 *  
 * @Description:  校友卡管理——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Wed Aug 22 13:58:54 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smCardDetails")
public class SmCardDetailsController extends BaseController {
	
	@Autowired
	private SmCardDetailsService smCardDetailsService;
		
	/**
	 * 获取校友卡管理列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smCardDetails
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmCardDetails> list(int pageNo,int pageSize,SmCardDetails smCardDetails) {
		PageIo<SmCardDetails> pageInfo =  smCardDetailsService.loadByPage(pageNo,pageSize,smCardDetails);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友卡管理
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smCardDetails
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@Validated SmCardDetails smCardDetails){
		smCardDetailsService.save(smCardDetails);							
		return SUCCESS;
	}	
	
	/**
	 * 删除校友卡管理（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smCardDetails
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmCardDetails smCardDetails) {
		smCardDetailsService.delete(smCardDetails);
		return SUCCESS;
	}
	
	/**
	 * 获取校友卡管理
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smCardDetails
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmCardDetails get(SmCardDetails smCardDetails) {
		return smCardDetailsService.get(smCardDetails);
	}
		
}