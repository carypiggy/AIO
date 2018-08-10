package com.mprs.aio.common.cache.redis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import org.springframework.stereotype.Component;

public class MyRedisConfigBean {
	 @Autowired
	    private StringRedisTemplate template;

	   //使用StringRedisTemplate进行所需操作
}
