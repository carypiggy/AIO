package com.mpri.aio.pf;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.common.utils.IdGen;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysUserService;

public class InitUserData extends ApplicationTests{

	@Autowired
	SysUserService sysUserService;
	
	@Value("${ps.salt}")
	private int saltTimes;
	
	@Test
	public void initUser() {
		SysUser su= new SysUser();
		su.setEmail("admin@163.com");
		su.setUsername("admin");
		su.setMobile("10000");
		su.setName("超级管理员");
		su.setOrgId("0");
		su.setIdcard("999999999");;
		String safecode=IdGen.uuid();
		su.setSafecode(safecode);
		ByteSource salt = ByteSource.Util.bytes(safecode);
		//加盐炒三次safecode=salt
		String result = new Md5Hash("admin",salt,saltTimes).toString();
		su.setPassword(result);
		su.setPhoto("");
		su.setRemark("nothing");
		su.setType("SUPER_ADMIN");
		sysUserService.save(su);
	}
	
	
}
