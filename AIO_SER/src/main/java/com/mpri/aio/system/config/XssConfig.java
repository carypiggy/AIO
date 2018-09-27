package com.mpri.aio.system.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mpri.aio.common.xss.XSSMappingJackson2HttpMessageConverter;

/**
 * xss过滤配置
 * 
 * @author Cary
 * @date 2018年9月19日
 */
@Configuration
public class XssConfig implements WebMvcConfigurer{

	/**
	 * 替换消息转换器
	 */
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(new XSSMappingJackson2HttpMessageConverter()); 
	}	
}
