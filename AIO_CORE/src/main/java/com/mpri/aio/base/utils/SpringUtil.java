package com.mpri.aio.base.utils;

import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * Spring boot 取bean工具类
 * @author Cary
 * @date 2018年8月2日
 */
@Component
@Order(1)
@Lazy(false)
public class SpringUtil implements ApplicationContextAware, DisposableBean {
	
	private static Logger logger = LoggerFactory.getLogger(SpringUtil.class);
	
	private static ApplicationContext applicationContext = null;	
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		if(SpringUtil.applicationContext == null) {
			SpringUtil.applicationContext = applicationContext;
		}
		logger.info("ApplicationContext配置成功,applicationContext对象："+SpringUtil.applicationContext);
	}
	
	/**
	 * 取得存储在静态变量中的ApplicationContext.
	 */
	public static ApplicationContext getApplicationContext() {
		assertContextInjected();
		return applicationContext;
	}
	
	public static Object getBean(String name) {
		assertContextInjected();
		return getApplicationContext().getBean(name);
	}
	
	public static <T> T getBean(Class<T> clazz) {
		assertContextInjected();
		return getApplicationContext().getBean(clazz);
	}
	
	public static <T> T getBean(String name,Class<T> clazz) {
		assertContextInjected();
		return getApplicationContext().getBean(name,clazz);
	}

	

	@Override
	public void destroy() throws Exception {
		SpringUtil.clearHolder();
		
	}
	
	/**
	 * 清除ApplicationContext为Null.
	 */
	public static void clearHolder() {
		if (logger.isDebugEnabled()){
			logger.debug("清除ApplicationContext:" + applicationContext);
		}
		applicationContext = null;
	}
	
	/**
	 * 检查ApplicationContext不为空.
	 */
	private static void assertContextInjected() {
		Validate.validState(applicationContext != null, "applicaitonContext属性未注入, 请定义SpringUtil.");
	}
}
