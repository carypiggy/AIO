package com.mprs.aio.system;


import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.Page;
import com.mprs.aio.ApplicationTests;
import com.mprs.aio.common.utils.IdGen;
import com.mprs.aio.system.model.SysUser;
import com.mprs.aio.system.service.SysUserService;

/**
* 类说明 
* @author Cary
* @date 2018年7月22日
*/
public class UserTest extends ApplicationTests {

	@Autowired
    private SysUserService sysUserService;
	
	
	//@Test
    public void testGetUsers(){
    	SysUser sysUser=sysUserService.get("");
		
		super.outprint("com.mprs.aio.system.model.SysUser", sysUser);
		
		
    }
	
	@Test
    public void testAddUsers(){
		//条数
		int num=30;
		//循环新增
		for(int i=0;i<=num;i++) {
			SysUser su= new SysUser();
			su.setFlag("0");
			su.setEmail(i+"@123.com");
			su.setUsername("test"+i);
			su.setMobile(i+"10000");
			su.setName("test"+i);
			su.setOrgId("0");
			su.setIdcard(String.valueOf(i));;
			String safecode=IdGen.uuid();
			su.setSafecode(safecode);
			//加盐炒三次safecode=salt
			String result = new Md5Hash("test"+i,safecode,3).toString();
			su.setPassword(result);
			su.setPhoto("");
			su.setRemark("nothing"+i);
			su.setType("0");
			try {
				
				sysUserService.save(su);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}

    }
    
    //@Test
    public void testloadUsers(){
    	
    	try{
    		SysUser su=new SysUser();
    		Page<SysUser> p=sysUserService.findPage(1, 10, su);
    		super.outprint("com.github.pagehelper.Page", p);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
  //@Test
    public void testLogin(){
    	
    	
    }
    
    
}
