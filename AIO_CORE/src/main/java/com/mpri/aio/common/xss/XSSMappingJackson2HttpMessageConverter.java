package com.mpri.aio.common.xss;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.JavaType;

/**
 * 报文的对象绑定处理
 * @author syp
 * @date 2018年9月27日
 */
@Configuration
public class XSSMappingJackson2HttpMessageConverter extends MappingJackson2HttpMessageConverter {

	@Override
	public Object read(Type type, Class<?> contextClass, HttpInputMessage inputMessage)
			throws IOException, HttpMessageNotReadableException {
		JavaType javaType = getJavaType(type, contextClass);
		Object obj = readJavaType(javaType, inputMessage);

//		String json = super.getObjectMapper().writeValueAsString(obj);		
//		String result = StringEscapeUtils.escapeHtml4(json.trim());
//		Object resultObj = super.getObjectMapper().readValue(json, javaType);

		Object tempObj = this.readAfter(obj, type);
		return tempObj;
	}

	/**
	 * 转义字段
	 * <p>Title: readAfter</p>  
	 * <p>Description: </p>  
	 * @param obj
	 * @param type
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private Object readAfter(Object obj, Type type) {
		try {
			// type实际上就是我们需要convert的model，我们通过反射来完成根据NeedXss注解对String
			// 的字段进行xss过滤
			Class clazz = Class.forName(JSON.toJSONString(type).replace("\"", ""));
			if (clazz == null) {
				return obj;
			}
			List<Field> fields = getFieldList(clazz);
			if (fields != null && fields.size() > 0) {
				// string类型字段名称列表
				List<String> strList = new ArrayList<String>(fields.size());
				// 1. 将需要xss处理的string类型的字段放入strlist
				for (int i = 0; i < fields.size(); i++) {
					String mod = Modifier.toString(fields.get(i).getModifiers());
					if (mod.indexOf("static") != -1)
						continue;
					// 得到属性的类名
					String className = fields.get(i).getType().getSimpleName();
					// 得到属性字段名
					if (className.equalsIgnoreCase("String")) {
						strList.add(fields.get(i).getName());
					}
				}
				// 2.将strlist中的字段进行xss处理
				Object temp = JSON.toJavaObject((JSON) JSON.toJSON(obj), clazz);
				if (strList.size() > 0) {
					for (int i = 0; i < strList.size(); i++) {
						Method set = clazz.getMethod(
								"set" + strList.get(i).substring(0, 1).toUpperCase() + strList.get(i).substring(1),
								String.class);
						Method get = clazz.getMethod(
								"get" + strList.get(i).substring(0, 1).toUpperCase() + strList.get(i).substring(1));
						Object tempObj = get.invoke(temp);
						if (tempObj == null) {
							continue;
						}
						String content = tempObj.toString();
						set.invoke(temp, StringEscapeUtils.escapeHtml4(content));
					}
					return temp;
				}
			}
		} catch (Exception e) {
			return obj;
		}
		return obj;
	}

	private Object readJavaType(JavaType javaType, HttpInputMessage inputMessage) {
		try {
			return super.getObjectMapper().readValue(inputMessage.getBody(), javaType);
		} catch (IOException ex) {
			throw new HttpMessageNotReadableException("Could not read JSON: " + ex.getMessage(), ex);
		}
	}

	@Override
	protected void writeInternal(Object object, HttpOutputMessage outputMessage)
			throws IOException, HttpMessageNotWritableException {
		String json = super.getObjectMapper().writeValueAsString(object);
//		String result = cleanXSS(json.toString());
		String result = StringEscapeUtils.escapeHtml4(json.trim());
		outputMessage.getBody().write(result.getBytes());
	}

	/**
	 * 获取该类的字段及父级字段
	* <p>Title: getFieldList</p>  
	* <p>Description: </p>  
	* @param clazz
	* @return
	 */
	private List<Field> getFieldList(Class<?> clazz){
	    if(null == clazz){
	        return null;
	    }
	    List<Field> fieldList = new LinkedList<Field>();
	    Field[] fields = clazz.getDeclaredFields();
	    for(Field field : fields){
	        /** 过滤静态属性**/
	        if(Modifier.isStatic(field.getModifiers())){
	            continue;
	        }
	        /** 过滤transient 关键字修饰的属性**/
	        if(Modifier.isTransient(field.getModifiers())){
	            continue;
	        }
	        fieldList.add(field);
	    }
	    /** 处理父类字段**/
	    Class<?> superClass = clazz.getSuperclass();
	    if(superClass.equals(Object.class)){
	        return fieldList;
	    }
	    fieldList.addAll(getFieldList(superClass));
	    return fieldList;
	}
}
