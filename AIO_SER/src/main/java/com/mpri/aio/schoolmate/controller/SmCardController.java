package com.mpri.aio.schoolmate.controller;

import java.util.Date;

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
import com.mpri.aio.schoolmate.model.SmCard;
import com.mpri.aio.schoolmate.service.SmCardService;

 /**   
 *  
 * @Description:  校友卡管理——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Wed Aug 22 13:57:05 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smCard")
public class SmCardController extends BaseController {
	
	@Autowired
	private SmCardService smCardService;
		
	/**
	 * 获取校友卡管理列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smCard
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmCard> list(int pageNo,int pageSize,SmCard smCard) {
		PageIo<SmCard> pageInfo =  smCardService.loadByPage(pageNo,pageSize,smCard);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友卡管理
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smCard
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public String save(@Validated SmCard smCard){
		if(smCard.getIsNewRecord())
		{
			smCard.setCreateDate(new Date());
		}
		smCardService.save(smCard);							
		return SUCCESS;
	}	
	
	/**
	 * 删除校友卡管理（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smCard
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmCard smCard) {
		smCardService.delete(smCard);
		return SUCCESS;
	}
	
	/**
	 * 获取校友卡管理
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smCard
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmCard get(SmCard smCard) {
		return smCardService.get(smCard);
	}
		
}