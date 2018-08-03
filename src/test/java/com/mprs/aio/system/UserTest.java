package com.mprs.aio.system;


import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.Page;
import com.mprs.aio.ApplicationTests;
import com.mprs.aio.common.utils.IdGen;
import com.mprs.aio.system.model.SysUser;
import com.mprs.aio.system.service.SysUserService;

/**
* 用户管理单元测试类
* @author Cary
* @date 2018年7月22日
*/
public class UserTest extends ApplicationTests {

	@Autowired
    private SysUserService sysUserService;
	
	/**
	 * 根据id获取单条数据 - 通过
	 */
	//@Test
    public void testGet(){
		SysUser su=new SysUser();
		su.setId("06cce4324a524e09a83d719d1564594d");
    	SysUser sysUser=sysUserService.get(su);
		
		super.outprint("com.mprs.aio.system.model.SysUser", sysUser);
    }
    
	/**
	 * 根据条件查询所有列表数据 - 通过
	 */
    //@Test
    public void  testloadAllListBy() {
    	SysUser su=new SysUser();
    	su.setType("0");
		List<SysUser> sysUserList=sysUserService.loadAllListBy(su);
		super.outprint("java.util.List", sysUserList);
		   
    }
    
	/**
	 * 新增- 通过
	 */
	@Test
    public void testAddUsers(){
		//条数
		int num=13;
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
			ByteSource salt = ByteSource.Util.bytes(safecode);
			//加盐炒三次safecode=salt
			String result = new Md5Hash("test"+i,salt,3).toString();
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
    
	/**
	 * 更新- 通过
	 */
	//@Test
    public void testUpdateUsers(){
		
			SysUser su= new SysUser();
			su.setId("922f904cd576421cadd3db0ebd5931d2");
			su.setFlag("0");
			su.setEmail("@123.com");
			su.setUsername("test");
			su.setMobile("10000");
			su.setName("test");
			su.setOrgId("0");
			su.setIdcard(String.valueOf(10086));;
			String safecode=IdGen.uuid();
			su.setSafecode(safecode);
			//加盐炒三次safecode=salt
			String result = new Md5Hash("test",safecode,3).toString();
			su.setPassword(result);
			su.setPhoto("");
			su.setRemark("nothing");
			su.setType("0");
			try {
				
				sysUserService.save(su);
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
    
    
    
    /**
     * 分页查询数据 -- 通过
     */
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
    
    /**
     * 根据username获取对象 - 通过
     */
    //@Test
    public void testGetUsersByUsername(){
    	
    	SysUser sysUser=sysUserService.getSysUserByUsername("test1");
		super.outprint("com.mprs.aio.system.model.SysUser", sysUser);
    }
    
    /**
     * 删除数据 
     */
    //@Test
    public void testDelete() {
    	SysUser sysUser=new SysUser();
    	sysUser.setId("922f904cd576421cadd3db0ebd5931d2");
    	sysUserService.delete(sysUser);
    	
    }
}
