package com.mpri.aio.pf;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.system.init.InitCache;
import com.mpri.aio.system.model.SysArea;
import com.mpri.aio.system.model.SysDict;
import com.mpri.aio.system.model.SysOrg;

/**
 * 初始化缓存测试
 * @author Cary
 * @date 2018年9月3日
 */
public class InitCacheTest extends ApplicationTests{
	
	
	//@Test
	public void testInitDict() {
		
		Map<String,List<SysDict>> dictCache =InitCache.dictCache;
		
		for (String key : dictCache.keySet()) {
			
			System.out.println(key);
			
		}
		System.out.println("当前具有数据集组数："+dictCache.size());
		
	}
	
	//@Test
	public void testInitArea() {
		
		Map<String,List<SysArea>> cache =InitCache.areaCache;
		
		for (String key : cache.keySet()) {
			
			System.out.println(key);
			
		}
		System.out.println("当前具有数据集组数："+cache.size());
		
	}
	
	@Test
	public void testInitOrg() {
		
		Map<String,List<SysOrg>> cache =InitCache.orgCache;
		
		for (String key : cache.keySet()) {
			
			System.out.println(key);
			
		}
		System.out.println("当前具有数据集组数："+cache.size());
		
	}
	
	

	

}
