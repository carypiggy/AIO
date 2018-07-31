package com.mprs.aio.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mprs.aio.base.controller.BaseController;
import com.mprs.aio.system.service.SysUserService;



@Controller
@RequestMapping("/sys/sysuser")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserService sysUserService;
	
	
	
	
	
}
