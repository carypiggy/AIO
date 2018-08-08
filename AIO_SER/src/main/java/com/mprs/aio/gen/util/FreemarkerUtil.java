package com.mprs.aio.gen.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import com.mprs.aio.gen.model.GenConfigInfo;
import com.mprs.aio.gen.model.GenExecuteResult;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 
* <p>Title: FreemarkerUtil</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月7日
 */
public class FreemarkerUtil {
	
	/**
	 * 
	* <p>Title: createFile</p>  
	* <p>Description: </p>  
	* @param genConfigInfo
	* @param templateName
	* @param filePath
	* @return
	 */
	public static GenExecuteResult createFile (GenConfigInfo genConfigInfo,String templateName, String filePath) {
		GenExecuteResult result = new GenExecuteResult();
		FileWriter out = null;
		/*
		 * 文件名称
		 */
		String fileName = genConfigInfo.getGenTableInfo().getEntityName() + getprefix(templateName);
		try {
			// 通过FreeMarker的Confuguration读取相应的模板文件
			Configuration configuration = new Configuration();
			// 设置模板路径
			configuration.setClassForTemplateLoading(FreemarkerUtil.class, "/templates/ftl");
			// 设置默认字体
			configuration.setDefaultEncoding("utf-8");
			// 获取模板
			Template template = configuration.getTemplate(templateName);
			File file = new File(filePath);
			// 创建父级目录
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			// 判断文件是否存在 并创建
			if (!file.exists()) {
				file.createNewFile();
			} else {
				result.setCode(-1);
				result.setMessage(fileName + "  已经存在");
				return result;
			}
			// 设置输出流
			out = new FileWriter(file);
			// 模板输出静态文件
			template.process(genConfigInfo, out);
			result.setCode(1);
			result.setMessage("创建" + fileName + "成功");
			return result;
		} catch (Exception e) {
			// 异常捕获
			e.printStackTrace();
		} finally {
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	/**
	 * 
	* <p>Title: getprefix</p>  
	* <p>Description: </p>  
	* @param name
	* @return
	 */
	private static String getprefix(String name) {
		if (name.equals("entity.ftl")) {
			name = ".java";
		} else if (name.equals("mapper_xml.ftl")) {
			name = "Mapper.xml";
		} else if (name.equals("mapper.ftl")) {
			name = "Mapper.java";
		} else if (name.equals("service.ftl")) {
			name = "Service.java";
		} else if (name.equals("controller.ftl")) {
			name = "Controller.java";
		}
		return name;
	}
}
