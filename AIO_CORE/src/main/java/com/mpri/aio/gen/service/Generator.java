package com.mpri.aio.gen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mpri.aio.gen.mapper.GenColumuInfoMapper;
import com.mpri.aio.gen.model.GenColumuInfo;
import com.mpri.aio.gen.model.GenConfigInfo;
import com.mpri.aio.gen.model.GenExecuteResult;
import com.mpri.aio.gen.model.GenTableInfo;
import com.mpri.aio.gen.util.EntityInfoUtil;
import com.mpri.aio.gen.util.FreemarkerUtil;

/**
 * 
* <p>Title: GenTableInfoService</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月7日
 */
@Service
public class Generator {

	//路径信息
	public static final String ENTITY="entity";
	public static final String MAPPER="dao";
	public static final String MAPPER_XML="mapper";
	public static final String SERVICE="service";
	public static final String CONTROLLER="controller";
	
	@Autowired
	private GenColumuInfoMapper genColumuInfoMapper;
	
	/**
	 * 便于测试
	* <p>Title: getGenColumuInfoByTable</p>  
	* <p>Description: </p>  
	* @return
	 */
	public List<GenColumuInfo> getGenColumuInfoByTable(){
		GenTableInfo genTableInfo = new GenTableInfo();
		genTableInfo.setTable("sys_dict");
		return genColumuInfoMapper.findTableColumnList(genTableInfo);
	}
	
	/**
	 * 组装GenConfigInfo
	* <p>Title: getGenConfigInfo</p>  
	* <p>Description: </p>  
	* @param genTableInfo
	* @return
	 */
	public GenTableInfo getGenConfigInfo(GenTableInfo genTableInfo) {
		genTableInfo.setColumuInfos(genColumuInfoMapper.findTableColumnList(genTableInfo));
		return genTableInfo;
	}

	/**
	 * 
	* <p>Title: createEntity</p>  
	* <p>Description: 创建实体类</p>  
	* @param url
	* @param configInfo
	* @return
	 */
	public GenExecuteResult createEntity(String url,GenConfigInfo configInfo) {
		String fileUrl= EntityInfoUtil.getGeneratorFileUrl(url, configInfo.getEntityUrl(), configInfo.getGenTableInfo().getEntityName(), ENTITY);
		return FreemarkerUtil.createFile(configInfo, "entity.ftl", fileUrl);
	}
	
	/**
	 * 
	* <p>Title: createDao</p>  
	* <p>Description: 创建Dao</p>  
	* @param url
	* @param configInfo
	* @return
	 */
	public GenExecuteResult createDao(String url,GenConfigInfo configInfo) {
		String fileUrl= EntityInfoUtil.getGeneratorFileUrl(url, configInfo.getDaoUrl(), configInfo.getGenTableInfo().getEntityName(), MAPPER);
		return FreemarkerUtil.createFile(configInfo, "mapper.ftl", fileUrl);
	}
	
	/**
	 * 
	* <p>Title: createService</p>  
	* <p>Description: 创建Service</p>  
	* @param url
	* @param configInfo
	* @return
	 */
	public GenExecuteResult createService(String url,GenConfigInfo configInfo) {
		String fileUrl= EntityInfoUtil.getGeneratorFileUrl(url, configInfo.getServiceUrl(), configInfo.getGenTableInfo().getEntityName(), SERVICE);
		return FreemarkerUtil.createFile(configInfo, "service.ftl", fileUrl);
	}
	
	/**
	 * 
	* <p>Title: createController</p>  
	* <p>Description: 创建Controller</p>  
	* @param url
	* @param configInfo
	* @return
	 */
	public GenExecuteResult createController(String url,GenConfigInfo configInfo) {
		String fileUrl= EntityInfoUtil.getGeneratorFileUrl(url, configInfo.getControllerUrl(), configInfo.getGenTableInfo().getEntityName(), CONTROLLER);
		return FreemarkerUtil.createFile(configInfo, "controller.ftl", fileUrl);
	}
	
	public GenExecuteResult createMapping(String url,GenConfigInfo configInfo) {
		String fileUrl= EntityInfoUtil.getGeneratorFileUrl(url, configInfo.getMapperUrl(), configInfo.getGenTableInfo().getEntityName(), MAPPER_XML);
		GenTableInfo genTableInfo = configInfo.getGenTableInfo();
		List<GenColumuInfo> list=genTableInfo.getColumuInfos();
		String agile="";
		for (GenColumuInfo columuInfo: list) {
			agile=agile+columuInfo.getColumnName()+", ";
		}
		agile=agile.substring(0, agile.length()-2);
		genTableInfo.setAgile(agile);
		configInfo.setGenTableInfo(genTableInfo);
		return FreemarkerUtil.createFile(configInfo, "mapper_xml.ftl", fileUrl);
	}
}
