package com.mpri.aio.system;


import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.utils.IdGen;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysUserService;

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
		su.setId("04bc3402c74e4e3c87e2e27b50a98a2e");
		
    	SysUser sysUser=sysUserService.get(su);
    	System.out.println("缓存测试：此处应取库");
    	SysUser sysUser2=sysUserService.get(su);
		System.out.println("缓存测试：此处应有掌声"+sysUser2.getId());

		super.outprint("com.mpri.aio.system.model.SysUser", sysUser);
    }
    
	
	
	/**
	 * 事务测试
	 */
	//@Test
	//@Transactional
	//@Rollback(true)
	public void testAddTran(){
		List<SysUser> userList=new ArrayList<SysUser>();
		SysUser su= new SysUser();
	 	su.setId("111");
		su.setFlag("0");
		su.setEmail("@123.com");
		su.setUsername("test");
		su.setMobile("10000");
		su.setName("test");
		su.setOrgId("0");
		su.setIdcard(String.valueOf(1));;
		String safecode=IdGen.uuid();
		su.setSafecode(safecode);
		ByteSource salt = ByteSource.Util.bytes(safecode);
		//加盐炒三次safecode=salt
		String result = new Md5Hash("test",salt,3).toString();
		su.setPassword(result);
		su.setPhoto("");
		su.setRemark("nothing");
		su.setType("0");
		userList.add(su);
		SysUser su2= new SysUser();
		su2.setUsername("test990");
		su2.setId("222");
		userList.add(su2);
 
	 	SysUser su3= new SysUser();
	 	su3.setId("1112");
	 	su3.setFlag("0");
	 	su3.setEmail("@123.com");
	 	su3.setUsername("test34");
	 	su3.setMobile("10000");
	 	su3.setName("test");
	 	su3.setOrgId("0");
	 	su3.setIdcard(String.valueOf(1));;
	 	su.setSafecode(safecode);
			//加盐炒三次safecode=salt
	 	su.setPassword(result);
	 	su.setPhoto("");
	 	su.setRemark("nothing");
	 	su.setType("0");
	 	userList.add(su3);
	 	//sysUserService.saveUsers(userList);
		 
		 
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
	//@Test
    public void testAddUsers(){
		//条数
		int num=2;
		//循环新增
		for(int i=0;i<=num;i++) {
			SysUser su= new SysUser();
			su.setEmail(i+"@123.com");
			su.setUsername("tester"+i);
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
    		PageIo<SysUser> p=sysUserService.loadByPage(1, 10, su);
    		super.outprint("com.mpri.aio.common.page.PageIo", p);

    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    /**
     * 根据username获取对象 - 通过
     */
    @Test
    public void testGetUsersByUsername(){
    	
		SysUser sysUser=sysUserService.getSysUserByUsername("test1");
    	System.out.println("缓存测试：此处应取库");
    	SysUser sysUser2=sysUserService.getSysUserByUsername("test1");
		System.out.println("缓存测试：此处应有掌声"+sysUser2.getId());
		super.outprint("com.mpri.aio.system.model.SysUser", sysUser);
		
		
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
