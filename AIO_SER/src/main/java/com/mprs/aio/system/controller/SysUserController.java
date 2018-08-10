package com.mprs.aio.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mprs.aio.base.controller.BaseController;
import com.mprs.aio.system.service.SysUserService;



@RestController
@RequestMapping("/sys/sysuser")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserService sysUserService;
	
	
	
	
	
}
