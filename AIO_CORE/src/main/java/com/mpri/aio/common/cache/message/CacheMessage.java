package com.mpri.aio.common.cache.message;

import java.io.Serializable;
/**
 * redis消息发布/订阅，传输的消息类
 * @author Cary
 * @date 2018年8月13日
 */

public class CacheMessage implements Serializable{

	private static final long serialVersionUID = 5987219310442078193L;

	private String cacheName;
	
	private Object key;

	public CacheMessage(String cacheName, Object key) {
		super();
		this.cacheName = cacheName;
		this.key = key;
	}

	public String getCacheName() {
		return cacheName;
	}

	public void setCacheName(String cacheName) {
		this.cacheName = cacheName;
	}

	public Object getKey() {
		return key;
	}

	public void setKey(Object key) {
		this.key = key;
	}
	
}
