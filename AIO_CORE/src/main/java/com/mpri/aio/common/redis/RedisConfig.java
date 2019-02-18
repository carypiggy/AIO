package com.mpri.aio.common.redis;

import java.io.Serializable;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * redis 序列化方式调整
 * @author Cary
 * @date 2019年2月12日
 */
//@Configuration
public class RedisConfig {
	 
	 	@Bean
	    public RedisTemplate<String, Serializable> redisTemplate(LettuceConnectionFactory connectionFactory) {
	        RedisTemplate<String, Serializable> redisTemplate = new RedisTemplate<>();
	        redisTemplate.setKeySerializer(new StringRedisSerializer());
	        redisTemplate.setValueSerializer(new GenericJackson2JsonRedisSerializer());
	        redisTemplate.setConnectionFactory(connectionFactory);
	        return redisTemplate;
	    }

}
