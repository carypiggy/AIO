package com.mpri.aio.system.init;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.mpri.aio.system.model.SysArea;
import com.mpri.aio.system.model.SysDict;
import com.mpri.aio.system.model.SysOrg;
import com.mpri.aio.system.service.SysAreaService;
import com.mpri.aio.system.service.SysDictService;
import com.mpri.aio.system.service.SysOrgService;



@Order(value=1)
@Component
public class InitCache implements CommandLineRunner{
	
	public static Map<String,List<SysDict>> dictCache = new HashMap<String,List<SysDict>>();
	
	public static Map<String,SysArea> areaCache= new HashMap<String,SysArea>();
	
	public static Map<String,SysOrg> orgCache= new HashMap<String,SysOrg>();
	
	
	
	
	@Autowired
	private SysDictService sysDictService;
	
	@Autowired
	private SysAreaService sysAreaService;
	
	@Autowired
	private SysOrgService sysOrgService;
	
	@Override
	public void run(String... args) throws Exception {
		
		//初始化字典
		SysDict sysDict=new SysDict();
		List<SysDict> dictAllList=sysDictService.loadAllListBy(sysDict);
		
		for(SysDict sd:dictAllList) {
			
			List<SysDict> dictList;
			
			if(dictCache.containsKey(sd.getTypeCode())) {
				dictList=dictCache.get(sd.getTypeCode());
				//放入新值
				dictList.add(sd);
				//放入新值
				dictCache.put(sd.getTypeCode(), dictList);
			}else {
				dictList = new ArrayList<SysDict>();
				dictList.add(sd);
				dictCache.put(sd.getTypeCode(),dictList);
			}
			
		}
		
		//初始化地区
		SysArea sysArea=new SysArea();
		List<SysArea> areaAllList=sysAreaService.loadAllListBy(sysArea);
		
		for(SysArea sa:areaAllList) {
			areaCache.put(sa.getId(), sa);	
		}
		
		//初始化机构
		SysOrg sysOrg=new SysOrg();
		List<SysOrg> orgAllList=sysOrgService.loadAllListBy(sysOrg);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
		
		for(SysOrg so:orgAllList) {
			orgCache.put(so.getId(), so);
		}
		
		System.out.println("》》数据初始化开始》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》");
		System.out.println("字典初始化条数："+dictCache.size());
		System.out.println("地区初始化条数："+areaCache.size());
		System.out.println("机构初始化条数："+orgCache.size());
		System.out.println("》》数据初始化完毕》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》");
		
	}
}
