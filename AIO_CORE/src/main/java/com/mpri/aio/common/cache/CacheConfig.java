package com.mpri.aio.common.cache;

import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.caffeine.CaffeineCache;
import org.springframework.cache.support.SimpleCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import com.github.benmanes.caffeine.cache.Caffeine;


/**
 * 咖啡因缓存配置
 * @author Cary
 * @date 2018年8月14日
 */
//@Configuration
//@EnableCaching
public class CacheConfig {
	public static final int DEFAULT_MAXSIZE = 50000;
	public static final int DEFAULT_TTL = 10;
	
	/**
	 * 定义Cache 名称，超时长度，最大容量
	 */
	public enum Caches{
			dictCache(600, 3000),//10分钟，最大容量3000
			menuCache(120,1000),
			pagePerCache(120,1000),
			perCache(120,3000),
			userCache(180,5000),
		;
		
		Caches() {
		}

		Caches(int ttl) {
			this.ttl = ttl;
		}

		Caches(int ttl, int maxSize) {
			this.ttl = ttl;
			this.maxSize = maxSize;
		}
		
		private int maxSize=DEFAULT_MAXSIZE;	//最大數量
		private int ttl=DEFAULT_TTL;		//过期时间（秒）
		
		public int getMaxSize() {
			return maxSize;
		}
		public int getTtl() {
			return ttl;
		}
	}
	
	/**
	 * 创建基于Caffeine的Cache Manager
	 * @return
	 */
	@Bean
	@Primary
	public CacheManager caffeineCacheManager() {
		SimpleCacheManager cacheManager = new SimpleCacheManager();
		
		ArrayList<CaffeineCache> caches = new ArrayList<CaffeineCache>();
		for(Caches c : Caches.values()){
			caches.add(new CaffeineCache(c.name(), 
				Caffeine.newBuilder().recordStats()
				.expireAfterWrite(c.getTtl(), TimeUnit.SECONDS)
				.maximumSize(c.getMaxSize())
				.build())
			);
		}
		
		cacheManager.setCaches(caches);

		return cacheManager;
	}

}
