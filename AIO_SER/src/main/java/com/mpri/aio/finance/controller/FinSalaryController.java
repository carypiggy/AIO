package com.mpri.aio.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.exception.ExceptionResult;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.finance.model.FinSalary;
import com.mpri.aio.finance.service.FinSalaryService;

/**   
 *  
 * @Description:  薪资管理——Controller
 * @Author:       Cary
 * @project 	  aio 
 * @CreateDate:   Wed Oct 17 09:58:29 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("finance/salary")
public class FinSalaryController extends BaseController{
	
	
	@Autowired
	private FinSalaryService finSalaryService;
		
	/**
	 * 获取列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize 
	* @param finSalary
	* @return
	 */
	@CrossOrigin
	@PostMapping("list")
	public PageIo<FinSalary> list(int pageNo,int pageSize,FinSalary finSalary) {
		PageIo<FinSalary> info = finSalaryService.loadByPage(pageNo,pageSize,finSalary);	
		return info;
	}
	
	
	/**
	 * 增加或者更新数据
	* <p>Title: save</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping("save")
	public RestResponse<String> save(@Validated FinSalary finSalary){
		finSalaryService.save(finSalary);							
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "保存成功！", "");
	}	
	
	/**
	 * 删除（逻辑删除）
	 * <p>Title: delete</p>  
	 * <p>Description: </p>  
	 * @param sysDict
	 * @return
	 */
	@CrossOrigin
	@PostMapping("delete")
	public RestResponse<String> delete(FinSalary finSalary) {
		finSalaryService.delete(finSalary);
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "删除成功！", "");
	}
	
	/**
	 * 根据id获取字典
	 * <p>Title: get</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@PostMapping("get")
	public RestResponse<FinSalary> get(FinSalary finSalary) {
		return new RestResponse<FinSalary>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", finSalaryService.get(finSalary));
	}
	
}
