package com.mpri.aio.system;

import org.apache.shiro.cache.CacheManager;
import org.junit.Test;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.base.utils.SpringUtil;

public class CacheUtilsTest  extends ApplicationTests{


	@Test
	public void initTets() {
		CacheManager cacheManager=SpringUtil.getBean(CacheManager.class);
		
		super.outprint("org.apache.shiro.cache.CacheManager", cacheManager);
		
	}
}
