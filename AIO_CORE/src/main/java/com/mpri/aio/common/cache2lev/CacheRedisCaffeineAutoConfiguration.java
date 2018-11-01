package com.mpri.aio.common.cache2lev;
import java.net.UnknownHostException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.session.SessionRepository;
import org.springframework.session.data.redis.RedisOperationsSessionRepository;

import com.alibaba.fastjson.support.spring.FastJsonRedisSerializer;
import com.mpri.aio.common.cache2lev.message.CacheMessageListener;

/**
 * Cache 相关 配置类
 * @author Cary
 * @date 2018年8月13日
 */

//@Configuration //按需开启
//@EnableConfigurationProperties(CacheRedisCaffeineProperties.class)
//@AutoConfigureAfter(RedisAutoConfiguration.class) //组件化时方可使用
public class CacheRedisCaffeineAutoConfiguration  extends CachingConfigurerSupport{
	
	@Autowired
	private CacheRedisCaffeineProperties cacheRedisCaffeineProperties;
	
	
	@Bean
    @Override
    public KeyGenerator keyGenerator() {
        return (target, method, params) -> {
            StringBuilder sb = new StringBuilder();
            sb.append(target.getClass().getName());
            sb.append(method.getName());
            for (Object obj : params) {
                sb.append(obj.toString());
            }
            return sb.toString();
        };
    }

	
	@Bean("cacheManager")
	@Primary
	@ConditionalOnBean(RedisTemplate.class)
	public RedisCaffeineCacheManager cacheManager(RedisTemplate<Object, Object> redisTemplate) {
		return new RedisCaffeineCacheManager(cacheRedisCaffeineProperties, redisTemplate);
	}
	
	@Bean
	@ConditionalOnMissingBean(name = "stringKeyRedisTemplate")
	public RedisTemplate<Object, Object> stringKeyRedisTemplate(LettuceConnectionFactory lettuceConnectionFactory) throws UnknownHostException {
		RedisTemplate<Object, Object> template = new RedisTemplate<Object, Object>();
		template.setConnectionFactory(lettuceConnectionFactory);
		
		//缓存相关
		template.setKeySerializer(new StringRedisSerializer());
		template.setHashKeySerializer(new StringRedisSerializer());
		
		//session相关
		// 设置值（value）的序列化采用FastJsonRedisSerializer。
        FastJsonRedisSerializer<Object> fastJsonRedisSerializer = new FastJsonRedisSerializer<>(Object.class);
        template.setValueSerializer(fastJsonRedisSerializer);
        template.setHashValueSerializer(fastJsonRedisSerializer);
        template.setDefaultSerializer(fastJsonRedisSerializer);
        template.afterPropertiesSet();
		
		return template;
	}
	
	@Bean
	public RedisMessageListenerContainer redisMessageListenerContainer(RedisTemplate<Object, Object> stringKeyRedisTemplate, 
			RedisCaffeineCacheManager redisCaffeineCacheManager) {
		RedisMessageListenerContainer redisMessageListenerContainer = new RedisMessageListenerContainer();
		redisMessageListenerContainer.setConnectionFactory(stringKeyRedisTemplate.getConnectionFactory());
		CacheMessageListener cacheMessageListener = new CacheMessageListener(stringKeyRedisTemplate, redisCaffeineCacheManager);
		redisMessageListenerContainer.addMessageListener(cacheMessageListener, new ChannelTopic(cacheRedisCaffeineProperties.getRedis().getTopic()));
		return redisMessageListenerContainer;
	}
	
	
	@Bean
    public SessionRepository<?> sessionRepository(LettuceConnectionFactory factory) throws UnknownHostException{
        RedisOperationsSessionRepository sessionRepository =  new RedisOperationsSessionRepository(stringKeyRedisTemplate(factory));
        FastJsonRedisSerializer<Object> fastJsonRedisSerializer = new FastJsonRedisSerializer<>(Object.class);
        sessionRepository.setDefaultSerializer(fastJsonRedisSerializer);
        sessionRepository.setDefaultMaxInactiveInterval(36000);
        return sessionRepository;
    }

}
