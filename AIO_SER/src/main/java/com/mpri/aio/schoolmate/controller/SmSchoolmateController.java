package com.mpri.aio.schoolmate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.schoolmate.model.SmAddress;
import com.mpri.aio.schoolmate.model.SmSchoolmate;
import com.mpri.aio.schoolmate.model.SmSchoolmateInfo;
import com.mpri.aio.schoolmate.service.SmAddressService;
import com.mpri.aio.schoolmate.service.SmSchoolmateService;

 /**   
 *  
 * @Description:  校友管理-校友表——Controller
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:32:38 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("/sys/smSchoolmate")
public class SmSchoolmateController extends BaseController {
	
	@Autowired
	private SmSchoolmateService smSchoolmateService;
	@Autowired
	private SmAddressService smAddressService;	
	/**
	 * 获取校友管理-校友表列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param smSchoolmate
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageInfo<SmSchoolmate> list(int pageNo,int pageSize,SmSchoolmate smSchoolmate) {
		PageIo<SmSchoolmate> pageInfo =  smSchoolmateService.loadByPage(pageNo,pageSize,smSchoolmate);							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新校友管理-校友表
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param smSchoolmate
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/save")
	public String save(@RequestBody SmSchoolmate smSchoolmate){
	//public String save(@RequestBody SmSchoolmateInfo smSchoolmateInfo){

		/*//证件类型是身份证时自动提取出生 年月日
		SmSchoolmate smSchoolmate = new SmSchoolmate();
		SmAddress smAddress = new SmAddress();
		smSchoolmate.setBirthday(smSchoolmateInfo.getBirthday());
		smSchoolmate.setCardId(smSchoolmateInfo.getCardId());
		smSchoolmate.setCardNum(smSchoolmateInfo.getCardNum());
		smSchoolmate.setCardStatus(smSchoolmateInfo.getCardStatus());
		smSchoolmate.setCardType(smSchoolmateInfo.getCardType());
		smSchoolmate.setComplete(smSchoolmateInfo.getComplete());
		smSchoolmate.setCreateDate(smSchoolmateInfo.getCreateDate());
		smSchoolmate.setFlag(smSchoolmateInfo.getFlag());
		smSchoolmate.setId(smSchoolmateInfo.getId());
		smSchoolmate.setName(smSchoolmateInfo.getName());
		smSchoolmate.setOpenid(smSchoolmateInfo.getOpenid());
		smSchoolmate.setPinyin(smSchoolmateInfo.getPinyin());*/
		
		smSchoolmateService.save(smSchoolmate);
		
		/*SmAddress address = new SmAddress();
		address.setCity(smSchoolmateInfo.getCity());
		address.setCountry(smSchoolmateInfo.getCountry());
		address.setDistrict(smSchoolmateInfo.getDistrict());
		address.setProvince(smSchoolmateInfo.getProvince());
		address.setId(smSchoolmateInfo.getAddressid());
		
		smAddressService.save(address);*/
		return SUCCESS;
	}	
	
	/**
	 * 删除校友管理-校友表（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param smSchoolmate
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public String delete(SmSchoolmate smSchoolmate) {
		smSchoolmateService.delete(smSchoolmate);
		return SUCCESS;
	}
	
	/**
	 * 获取校友管理-校友表
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param smSchoolmate
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SmSchoolmate get(SmSchoolmate smSchoolmate) {
		return smSchoolmateService.get(smSchoolmate);
	}
	
		
	
	
}