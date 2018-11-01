package com.mpri.aio.system.config;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;

import org.springframework.cache.CacheManager;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
//@AutoConfigureAfter(RedisAutoConfiguration.class)
public class RedisConfig {
	@Bean
	public KeyGenerator simpleKeyGenerator() {
		return (o, method, objects) -> {
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append(o.getClass().getSimpleName());
			stringBuilder.append(".");
			stringBuilder.append(method.getName());
			stringBuilder.append("[");
			for (Object obj : objects) {
				stringBuilder.append(obj.toString());
			}
			stringBuilder.append("]");

			return stringBuilder.toString();
		};
	}

	@Bean
	public CacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
		return new RedisCacheManager(RedisCacheWriter.nonLockingRedisCacheWriter(redisConnectionFactory),
				this.getRedisCacheConfigurationWithTtl(900), // 默认策略，未配置的 key 会使用这个
				this.getRedisCacheConfigurationMap() // 指定 key 策略
		);
	}

	private Map<String, RedisCacheConfiguration> getRedisCacheConfigurationMap() {
		Map<String, RedisCacheConfiguration> redisCacheConfigurationMap = new HashMap<>();
		redisCacheConfigurationMap.put("menuCache", this.getRedisCacheConfigurationWithTtl(1200));
		redisCacheConfigurationMap.put("pagePerCache", this.getRedisCacheConfigurationWithTtl(1200));
		redisCacheConfigurationMap.put("perCache", this.getRedisCacheConfigurationWithTtl(1200));
		redisCacheConfigurationMap.put("userCache", this.getRedisCacheConfigurationWithTtl(1200));
		redisCacheConfigurationMap.put("dictCache", this.getRedisCacheConfigurationWithTtl(3600));
		redisCacheConfigurationMap.put("roleCache", this.getRedisCacheConfigurationWithTtl(1200));
		
		return redisCacheConfigurationMap;
	}

	private RedisCacheConfiguration getRedisCacheConfigurationWithTtl(Integer seconds) {
	        Jackson2JsonRedisSerializer<Object> jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer<>(Object.class);
	        ObjectMapper om = new ObjectMapper();
	        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
	        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
	        jackson2JsonRedisSerializer.setObjectMapper(om);

	        RedisCacheConfiguration redisCacheConfiguration = RedisCacheConfiguration.defaultCacheConfig();
	        redisCacheConfiguration = redisCacheConfiguration.serializeValuesWith(
	            RedisSerializationContext
	                .SerializationPair
	                .fromSerializer(jackson2JsonRedisSerializer)
	        ).entryTtl(Duration.ofSeconds(seconds));

	        return redisCacheConfiguration;
	        }

	/**
	 * Redis的模板 作为发布者
	 * 
	 * @param connectionFactory
	 * @return
	 */
	@Bean
	public StringRedisTemplate template(LettuceConnectionFactory connectionFactory) {
		return new StringRedisTemplate(connectionFactory);
	}

}