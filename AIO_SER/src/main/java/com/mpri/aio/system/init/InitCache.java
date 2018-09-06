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


/**
 * 初始化字典 地区 机构数据
 * @author Cary
 * @date 2018年9月3日
 */
@Order(value=1)
@Component
public class InitCache implements CommandLineRunner{
	
	public static Map<String,List<SysDict>> dictCache = new HashMap<String,List<SysDict>>();
	
	public static Map<String,SysArea> areaBaseCache= new HashMap<String,SysArea>();
	
	public static Map<String,List<SysArea>> areaCache= new HashMap<String,List<SysArea>>();
	
	public static Map<String,SysOrg> orgBaseCache= new HashMap<String,SysOrg>();
	
	public static Map<String,List<SysOrg>> orgCache= new HashMap<String,List<SysOrg>>();
	

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
		
		//areaCache
		SysArea sysArea=new SysArea();
		List<SysArea> areaAllList=sysAreaService.loadAllListBy(sysArea);
		
		for(SysArea sa:areaAllList) {
			//base area cache
			areaBaseCache.put(sa.getId(), sa);
			
			//area cache for parent
			List<SysArea> areaList;
			if(areaCache.containsKey(sa.getParentId())) {
				areaList=areaCache.get(sa.getParentId());
				//放入新值
				areaList.add(sa);
				//放入新值
				areaCache.put(sa.getParentId(), areaList);
			}else {
				areaList = new ArrayList<SysArea>();
				areaList.add(sa);
				areaCache.put(sa.getParentId(),areaList);
			}
		}
		
		
		//初始化机构
		SysOrg sysOrg=new SysOrg();
		List<SysOrg> orgAllList=sysOrgService.loadAllListBy(sysOrg);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
		
		for(SysOrg so:orgAllList) {
			//base org cache 
			orgBaseCache.put(so.getId(), so);
			
			//org cache for parent
			List<SysOrg> orgList;
			if(orgCache.containsKey(so.getParentId())) {
				orgList=orgCache.get(so.getParentId());
				//放入新值
				orgList.add(so);
				//放入新值
				orgCache.put(so.getParentId(), orgList);
			}else {
				orgList = new ArrayList<SysOrg>();
				orgList.add(so);
				orgCache.put(so.getParentId(),orgList);
			}
			
		}
		
		System.out.println("》》系统基础数据初始化开始》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》");
		System.out.println("字典数据初始化条数："+dictCache.size());
		System.out.println("地区父子初始化条数："+areaCache.size());
		System.out.println("地区基准初始化条数："+areaBaseCache.size());
		System.out.println("机构父子初始化条数："+orgCache.size());
		System.out.println("机构基准初始化条数："+orgBaseCache.size());
		System.out.println("》》系统基础数据初始化完毕》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》");
		
	}
}
