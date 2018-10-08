package com.mpri.aio.gen.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mpri.aio.gen.model.GenColumuInfo;
import com.mpri.aio.gen.model.GenConfigInfo;
import com.mpri.aio.gen.model.GenTableInfo;

/**
 * @author syp
 * @version 创建时间：2018年8月4日 下午12:40:21 类说明
 */
public class EntityInfoUtil {
	
	public static final String ID = "id";
	public static final String FLAG = "flag";
	public static final String REMARK = "remark";
	public static final String CREATEDATE = "create_date";
	/**
	 * 
	* <p>Title: getInfo</p>  
	* <p>Description: </p>  
	* @param configInfo
	* @param statu   为true则过滤 id remark flag 反之
	* @return
	* @throws SQLException
	 */
	public static GenConfigInfo getInfo(GenConfigInfo configInfo,Boolean statu){
		GenTableInfo genTableInfo = configInfo.getGenTableInfo();
		
		List<GenColumuInfo> columns = genTableInfo.getColumuInfos(); 
		
		List<GenColumuInfo> columns_checked = new ArrayList<GenColumuInfo>();
		if(statu) {
			for (GenColumuInfo genColumuInfo : columns) {
				genColumuInfo.setJavaType(MySqlToJavaUtil.jdbcTypeToJavaType(genColumuInfo.getColumnType()));
				genColumuInfo.setObjProperty(MySqlToJavaUtil.changeToJavaFiled(genColumuInfo.getColumnName()));	
				columns_checked.add(genColumuInfo);
			}
		}else {
			//过滤到ID REMARK FLAG 属性
			for (GenColumuInfo genColumuInfo : columns) {
				if(ID.equalsIgnoreCase(genColumuInfo.getColumnName()) ||
						FLAG.equalsIgnoreCase(genColumuInfo.getColumnName()) || 
						REMARK.equalsIgnoreCase(genColumuInfo.getColumnName()) ||
						CREATEDATE.equalsIgnoreCase(genColumuInfo.getColumnName())) {
					continue;
				}else {
					genColumuInfo.setJavaType(MySqlToJavaUtil.jdbcTypeToJavaType(genColumuInfo.getColumnType()));
					genColumuInfo.setObjProperty(MySqlToJavaUtil.changeToJavaFiled(genColumuInfo.getColumnName()));	
					columns_checked.add(genColumuInfo);
				}
			}
		}

		genTableInfo.setColumuInfos(columns_checked);
		configInfo.setGenTableInfo(genTableInfo);
		return configInfo;
	}
	
	/**
	 * 
	* <p>Title: getGeneratorFileUrl</p>  
	* <p>Description: 生成文件路径</p>  
	* @param url
	* @param packageUrl
	* @param entityName
	* @param type
	* @return
	 */
	public static String getGeneratorFileUrl(String url,String packageUrl,String entityName, String type){
		if (type.equals("entity")) {
			return url+pageToUrl(packageUrl)+entityName+".java";
		}else if(type.equals("dao")) {
			return url+pageToUrl(packageUrl)+entityName+"Mapper.java";
		}else if(type.equals("mapper")) {
			return url+pageToUrl(packageUrl)+entityName+"Mapper.xml";
		}else if(type.equals("service")) {
			return url+pageToUrl(packageUrl)+entityName+"Service.java";
		}else if(type.equals("controller")) {
			return url+pageToUrl(packageUrl)+entityName+"Controller.java";
		}
		return null;
	}
	
	/**
	 * 
	* <p>Title: pageToUrl</p>  
	* <p>Description: 解析包名</p>  
	* @param url
	* @return
	 */
	public static String pageToUrl(String url) {
		return url.replace(".", "/")+"/";
	}
}
