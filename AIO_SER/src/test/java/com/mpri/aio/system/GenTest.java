package com.mpri.aio.system;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import com.mpri.aio.ApplicationTests;
import com.mpri.aio.gen.model.GenColumuInfo;
import com.mpri.aio.gen.model.GenConfigInfo;
import com.mpri.aio.gen.model.GenTableInfo;
import com.mpri.aio.gen.service.Generator;
import com.mpri.aio.gen.util.EntityInfoUtil;
import com.mpri.aio.gen.util.MySqlToJavaUtil;

/**
 * 
* <p>Title: GenTest</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月7日
 */
public class GenTest extends ApplicationTests {
	@Autowired
	private Generator generator;
	
	//是否加载ID、Flag、Remark
	public static final boolean LODE = true;
	public static final boolean NOT_LODE = false;
	
	//路径信息
	public static final String ENTITY_URL="com.suyupeng.entity";
	public static final String MAPPER_URL="com.suyupeng.mapper";
	public static final String MAPPER_XML_URL="com.suyupeng.mapper.xml";
	public static final String SERVICE_URL="com.suyupeng.service";
	public static final String CONTROLLER_URL="com.suyupeng.controller";
	
	//需要修改的
	public static final String TABLE = "sys_area";
	public static final String CLASSCOMMENT ="编码信息";
	public static final String URL = "E:\\BD\\gen\\";
	public static final String TIME=new Date().toString();
	public static final String AGILE=new Date().getTime()+"";
	
	
	
	
	@Test
	public void test() {
		//设相关值
		GenConfigInfo genConfigInfo = new GenConfigInfo();
		genConfigInfo.setAuthor("SYP");
		genConfigInfo.setCreateTime((new Date()).toString());
		genConfigInfo.setEntityUrl(ENTITY_URL);
		genConfigInfo.setDaoUrl(MAPPER_URL);
		genConfigInfo.setServiceUrl(SERVICE_URL);
		genConfigInfo.setControllerUrl(CONTROLLER_URL);
		genConfigInfo.setMapperUrl(MAPPER_XML_URL);
		genConfigInfo.setProject("AIO");
		genConfigInfo.setVersion("v_1.0");
		genConfigInfo.setCreateTime(TIME);
		
		
		GenTableInfo genTableInfo  =  new GenTableInfo();
		genTableInfo.setTable(TABLE);
		genTableInfo.setAgile(AGILE);
		genTableInfo.setEntityName(MySqlToJavaUtil.getClassNameBytableName(TABLE));
		genTableInfo.setObjectName(MySqlToJavaUtil.changeToJavaFiled(TABLE));
		genTableInfo.setEntityComment(CLASSCOMMENT);
		genTableInfo = generator.getGenConfigInfo(genTableInfo);
		
		genConfigInfo.setGenTableInfo(genTableInfo);
		
		
		
		
		genConfigInfo=EntityInfoUtil.getInfo(genConfigInfo,LODE);
		
		
//		//生成实体类  checked
//		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createEntity(URL, genConfigInfo));
		//生成Dao   chedked
//		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createDao(URL, genConfigInfo));
		//生成Service   checked
//		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createService(URL, genConfigInfo));
		//生成Controller   checked
//		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createController(URL, genConfigInfo));
		//生成mapper 映射文件
		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createMapping(URL, genConfigInfo));
	}
	
	
	
}
