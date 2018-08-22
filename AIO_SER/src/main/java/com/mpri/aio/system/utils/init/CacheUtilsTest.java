package com.mpri.aio.system.utils.init;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;

public class CacheUtilsTest implements CacheManager{

	
	public CacheUtilsTest() {
		
		System.out.println("------------init CacheUtilsTest-----------");
		
	}

	@Override
	public <K, V> Cache<K, V> getCache(String arg0) throws CacheException {
		// TODO Auto-generated method stub
		return null;
	}
}
