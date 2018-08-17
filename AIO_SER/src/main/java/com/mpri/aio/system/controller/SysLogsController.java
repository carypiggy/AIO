package com.mpri.aio.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.system.model.SysLogs;
import com.mpri.aio.system.service.SysLogsService;

	/**
	 *        系统日志模块——controller
	* <p>Title: SysLogsController</p>  
	* <p>Description: </p>  
	* @author syp  
	* @date 2018年8月16日
	 */
@RestController
@RequestMapping("sys/syslogs")
public class SysLogsController extends BaseController{
	
	@Autowired
	private SysLogsService sysLogsService;
	
	
	/**
	 * 日志管理列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param sysLogs
	* @return
	 */
	@CrossOrigin
	@GetMapping(value = "/list")
	public PageIo<SysLogs> list(int pageNo,int pageSize,SysLogs sysLogs){
		return sysLogsService.loadByPage(pageNo, pageSize, sysLogs);
	}
	
	/**
	 * 日志管理列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param sysLogs
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public SysLogs get(SysLogs sysLogs){
		return sysLogsService.get(sysLogs);
	}
}
