package com.mpri.aio.schoolmate.controller;

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
import com.mpri.aio.schoolmate.model.SmAddress;
import com.mpri.aio.schoolmate.service.SmAddressService;

 /**   
 *  
 * @Description:  校友管理-校友地址管理——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:21:32 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smAddress")
public class SmAddressController extends BaseController {
	
	@Autowired
	private SmAddressService smAddressService;
		
	/**
	 * 获取校友管理-校友校园经历表列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smAddress
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmAddress> list(int pageNo,int pageSize,SmAddress smAddress) {
		PageIo<SmAddress> pageInfo =  smAddressService.loadByPage(pageNo,pageSize,smAddress);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友管理-校友校园经历表
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smAddress
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@Validated SmAddress smAddress){
		smAddressService.save(smAddress);							
		return SUCCESS;
	}	
	
	/**
	 * 删除校友管理-校友校园经历表（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smAddress
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmAddress smAddress) {
		smAddressService.delete(smAddress);
		return SUCCESS;
	}
	
	/**
	 * 获取校友管理-校友校园经历表
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smAddress
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmAddress get(SmAddress smAddress) {
		return smAddressService.get(smAddress);
	}
		
}