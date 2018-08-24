package com.mpri.aio.system;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.mpri.aio.ApplicationTests;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.utils.IdGen;
import com.mpri.aio.system.model.SysArea;
import com.mpri.aio.system.service.SysAreaService;

/**
* .用户管理单元测试类
* @author lzw
* @date 2018年7月22日
*/
public class AreaTest extends ApplicationTests {

	@Autowired
    private SysAreaService sysAreaService;
    
	/**
	 *. 新增  -- 通过
	 */
	//@Test
    public void testAddUsers(){
		//条数
		int num=30;
		//循环新增
		for(int i=0;i<=num;i++) {
			SysArea area = new SysArea();
			String typeCode=IdGen.uuid();
			area.setCode(typeCode);
			area.setFlag("0");
			area.setName("name"+i);
			area.setParentId("pareentid"+i);
			area.setParentIds("parentIds"+i);
			area.setRemark("reark");
			area.setSort(0L);
			area.setType("1");
			
			try {
				
				sysAreaService.save(area);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
    }
    
	/**
	 *. 更新 -- 通过
	 */
//	@Test
    public void testUpdateUsers(){
		
		SysArea area = new SysArea();
		area.setId("14786489e73c47e9a261507c1ddfa220");
		String typeCode=IdGen.uuid();
		area.setCode(typeCode);
		area.setFlag("0");
		area.setName("name0");
		area.setParentId("pareentid0");
		area.setParentIds("parentIds0");
		area.setRemark("reark");
		area.setSort(0L);
		area.setType("0");
			try {
				sysAreaService.save(area);
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
    
	/**
	 * .根据id获取单条数据   -- 通过
	 */
	//@Test
    public void testGet(){
		SysArea area=  new SysArea();
		area.setId("14786489e73c47e9a261507c1ddfa220");
		SysArea sysArea=sysAreaService.get(area);
		
		super.outprint("com.mpri.aio.system.model.SysArea", sysArea);
    }
    
	/**
	 *. 根据条件查询所有列表数据    -- 通过
	 */
    @Test
    public void  testloadAllListBy() {
    	SysArea area=  new SysArea();
   	    area.setFlag("0");
    //	area.setParentId("Root");
		List<SysArea> sysAreaList=sysAreaService.loadAllListBy(area);
		super.outprint("java.util.List", sysAreaList);
		   
    }
    
    /**
     * .分页查询数据  -- 通过
     */
    @Test
    public void testloadUsers(){
    	
    	try{
    		
    		SysArea area=  new SysArea();
    		PageIo<SysArea> p=sysAreaService.loadByPage(1, 10, area);

    		super.outprint("com.github.pagehelper.Page", p);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    /**
     * .删除数据  -- 通过
     */
    //@Test
    public void testDelete() {
    	SysArea area=  new SysArea();
    	area.setId("7ba8ac3be7934499828dc9d665f740ac");
    	sysAreaService.delete(area);
    	
    }
    
    /**
     * .根据code获取地区
     */
    @Test
    public void testGetAreaByCode()
    {
    	sysAreaService.getSysAreaByCode("af9434401e7f4a74af615505547fe1af");
    	
    }
}
