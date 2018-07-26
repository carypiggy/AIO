package com.mprs.aio.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mprs.aio.system.model.SysUsers;
import com.mprs.aio.system.service.SysUsersService;



/**
* 用户信息控制器
* @author Cary
* @date 2018年7月22日
*/
@RestController
@EnableAutoConfiguration
public class SysUsersController {
	@Autowired
    private SysUsersService sysUsersService;
	
	@RequestMapping("/addSysUsers")
    public int addInfo(@RequestParam(value = "sysUsers")SysUsers	 sysUsers) {
		
        return sysUsersService.addSysUsers(sysUsers);
    }
	
	@ResponseBody
	@RequestMapping("/getSysUsers")
    public SysUsers addInfo(@RequestParam(value = "id")long id) {
		
        return sysUsersService.getSysUsers(id);
    }
	
	
	
}
