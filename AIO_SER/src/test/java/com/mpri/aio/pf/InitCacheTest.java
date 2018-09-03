package com.mpri.aio.pf;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.system.init.InitCache;
import com.mpri.aio.system.model.SysDict;

/**
 * 初始化缓存测试
 * @author Cary
 * @date 2018年9月3日
 */
public class InitCacheTest extends ApplicationTests{
	
	
	@Test
	public void testInitDict() {
		
		Map<String,List<SysDict>> dictCache =InitCache.dictCache;
		super.outprint("java.util.Map", dictCache);
		System.out.println("当前具有数据集组数："+dictCache.size());
		
	}
	
	
	
	
	

	

}
