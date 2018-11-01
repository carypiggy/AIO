package com.mpri.aio.gen;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mpri.aio.ApplicationTests;
import com.mpri.aio.gen.model.GenConfigInfo;
import com.mpri.aio.gen.model.GenTableInfo;
import com.mpri.aio.gen.service.Generator;
import com.mpri.aio.gen.util.EntityInfoUtil;
import com.mpri.aio.gen.util.MySqlToJavaUtil;

/**
 * gen的测试类
* <p>Title: GenTemplateTest</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月8日
 */
public class GenTemplateTest extends ApplicationTests {

	@Autowired
	private Generator generator;
	
	//是否加载ID、Flag、Remark
	public static final boolean LODE = true;
	public static final boolean NOT_LODE = false;
	
	//路径信息E:\git_res\AIO\AIO_SER\src\main\resources\mapping\system
	public static final String ENTITY_URL="com.mpri.aio.finance.model";
	public static final String MAPPER_URL="com.mpri.aio.finance.mapper";
	public static final String MAPPER_XML_URL="finance";
	public static final String SERVICE_URL="com.mpri.aio.finance.service";
	public static final String CONTROLLER_URL="com.mpri.aio.finance.controller";
	
	//需要修改的

	public static final String TABLE = "fin_salary_detail";    //表名
	public static final String CLASSCOMMENT ="薪资管理"; //模块名称
	public static final String JAVA_URL = "D:\\workspace\\AIO\\AIO_SER\\src\\main\\java\\";  // 物理路径       E:\git_res\AIO\AIO_SER\src\main\java
	public static final String XML_URL = "D:\\workspace\\AIO\\AIO_SER\\src\\main\\resources\\mapping\\";
	public static final String TIME=new Date().toString();  // 创建时间
	public static final String AGILE=new Date().getTime()+"";	//序列化 -扩展字段
	
	@Test
	public void creat(){
		//设相关值
		GenConfigInfo genConfigInfo = new GenConfigInfo();
		//作者名
		genConfigInfo.setAuthor("Cary");
		//项目名
		genConfigInfo.setProject("aio");
		//版本号
		genConfigInfo.setVersion("v_1.0");
		
		//mapping的GenConfigInfo对象
		GenConfigInfo genConfigInfoMapping = setGenConfigInfo(genConfigInfo);		
		//此处需要id remark flag等数据操作
		genConfigInfoMapping = EntityInfoUtil.getInfo(genConfigInfoMapping,LODE);
		//生成mapper 映射文件
		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createMapping(XML_URL, genConfigInfoMapping));

		
		
		//mapping的GenConfigInfo对象
		GenConfigInfo genConfigInfoJava = setGenConfigInfo(genConfigInfo);
		genConfigInfoJava=EntityInfoUtil.getInfo(genConfigInfoJava,NOT_LODE);
		//生成实体类  checked
		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createEntity(JAVA_URL, genConfigInfo));
		//生成Dao   chedked
		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createDao(JAVA_URL, genConfigInfo));
		//生成Service   checked
		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createService(JAVA_URL, genConfigInfo));
		//生成Controller   checked
		super.outprint("com.mpri.aio.gen.model.GenExecuteResult", generator.createController(JAVA_URL, genConfigInfo));

	}
	
	
	/**
	 * 装载对象
	* <p>Title: setGenConfigInfo</p>  
	* <p>Description: </p>  
	* @param genConfigInfo
	* @return
	 */
	private GenConfigInfo setGenConfigInfo(GenConfigInfo genConfigInfo) {
		genConfigInfo.setCreateTime(TIME);
		genConfigInfo.setCreateTime((new Date()).toString());
		genConfigInfo.setEntityUrl(ENTITY_URL);
		genConfigInfo.setDaoUrl(MAPPER_URL);
		genConfigInfo.setServiceUrl(SERVICE_URL);
		genConfigInfo.setControllerUrl(CONTROLLER_URL);
		genConfigInfo.setMapperUrl(MAPPER_XML_URL);
		
		GenTableInfo genTableInfo  =  new GenTableInfo();
		genTableInfo.setTable(TABLE);
		genTableInfo.setAgile(AGILE);
		genTableInfo.setEntityName(MySqlToJavaUtil.getClassNameBytableName(TABLE));
		genTableInfo.setObjectName(MySqlToJavaUtil.changeToJavaFiled(TABLE));
		genTableInfo.setEntityComment(CLASSCOMMENT);
		genTableInfo = generator.getGenConfigInfo(genTableInfo);;
		genConfigInfo.setGenTableInfo(genTableInfo);
		return genConfigInfo;
	}
}
