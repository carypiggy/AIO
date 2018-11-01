package com.mpri.aio.common.cache2lev.message;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;

import com.mpri.aio.common.cache2lev.RedisCaffeineCacheManager;

/**
 * 监听redis消息
 * @author Cary
 * @date 2018年8月13日
 */
public class CacheMessageListener implements MessageListener{

	private final Logger logger = LoggerFactory.getLogger(CacheMessageListener.class);

	private RedisTemplate<Object, Object> redisTemplate;
	
	private RedisCaffeineCacheManager redisCaffeineCacheManager;

	public CacheMessageListener(RedisTemplate<Object, Object> redisTemplate,
			RedisCaffeineCacheManager redisCaffeineCacheManager) {
		super();
		this.redisTemplate = redisTemplate;
		this.redisCaffeineCacheManager = redisCaffeineCacheManager;
	}

	@Override
	public void onMessage(Message message, byte[] pattern) {
		//CacheMessage cacheMessage = (CacheMessage) redisTemplate.getValueSerializer().deserialize(message.getBody());
		//logger.debug("recevice a redis topic message, clear local cache, the cacheName is {}, the key is {}", cacheMessage.getCacheName(), cacheMessage.getKey());
		//redisCaffeineCacheManager.clearLocal(cacheMessage.getCacheName(), cacheMessage.getKey());
	}

}
