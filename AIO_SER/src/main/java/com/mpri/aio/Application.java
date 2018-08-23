package com.mpri.aio;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;
/**
 *.主函数
 * @author Cary
 * @date 2018年7月18日
 */
@SpringBootApplication
@EnableTransactionManagement
@EnableCaching// 开启缓存，需要显示的指定
@EnableAsync// 开启异步
public class Application {
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}
