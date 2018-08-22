package com.mpri.aio.system;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.system.model.SysDict;
import com.mpri.aio.system.service.SysDictService;
/**
 * .字典测试类
 * @author xw
 * @date 2018年8月3日
 */
public class DictTest extends ApplicationTests{
	
	@Autowired
    private SysDictService sysDictService;
	
	/**
	 * 新增--通过
	 */
//	@Test
    public void testAddDicts(){
		//条数
		int num = 10;
		//循环新增
		for(int i = 6;i <= num;i++){
			SysDict sysDict = new SysDict();
			sysDict.setFlag("0");
			sysDict.setTypeCode("A"+i);
			sysDict.setLabel("label"+i);
			sysDict.setValue("value"+i);
			sysDict.setRemark("remark"+i);
			sysDict.setSort((long)1);
			try {
				sysDictService.save(sysDict);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
    }
	
	
	 /**
	  * 删除--通过
     */
//    @Test
    public void testDelete() {
    	SysDict sysDict = new SysDict();
    	sysDict.setId("6fcac6beaabc46e1a8c3729d53827fc4");
    	sysDictService.delete(sysDict);
    	
    }
    
    /**
	 * 根据id获取单条数据 - 通过
	 */
	//@Test
    public void testGet(){
		SysDict sd = new SysDict();
		sd.setId("1e790d1e9ceb4425bbbca422fbd5836a");
		SysDict sysDict=sysDictService.get(sd);
		
		super.outprint("com.mpri.aio.system.model.SysDict", sysDict);
    }
	
	
	 /**
	  * 根据typecode获取对象  --通过
     */
    @Test
    public void testGetDictByTypecode(){
    	
    	List<SysDict> sysDict = sysDictService.getSysDictByTypecode("SEX");
    	System.out.println("缓存测试：此处应取库");
    	List<SysDict> sysDict2 = sysDictService.getSysDictByTypecode("SEX");
    	System.out.println("缓存测试：此处应有掌声");
		//super.outprint("com.mpri.aio.system.model.SysDict", sysDict);
    }
	
    
    /**
	 * 根据条件查询所有列表数据 --通过
	 */
//    @Test
    public void  testloadAllListBy() {
    	SysDict sysDict = new SysDict();
    	sysDict.setSort((long)1);
		List<SysDict> sysDictList = sysDictService.loadAllListBy(sysDict);
		super.outprint("java.util.List", sysDictList);
		   
    }
	
    
    
    /**
	 * 更新-通过
	 */
//	@Test
    public void testUpdateDict(){
		
			SysDict sysDict = new SysDict();
			sysDict.setId("940b8b6451524dbcacd533e464b993cd");
			try {
				sysDict.setFlag("2");
				sysDict.setTypeCode("B9");
				sysDict.setLabel("B9");
				sysDict.setValue("B9");
				sysDict.setRemark("B9");
				sysDict.setSort((long)20);
				sysDictService.save(sysDict);
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
	
	
	 /**
     * 分页查询数据  --通过
     */
    //@Test
    public void testloadDict(){
    	
    	try{
    		SysDict sysDict = new SysDict();
    		PageIo<SysDict> p = sysDictService.loadByPage(1, 6, sysDict);

    		super.outprint("com.github.pagehelper.Page", p);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
	
    
	
	

}
