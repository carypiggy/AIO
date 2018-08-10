package com.mpri.aio;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
/**
 *.主函数
 * @author Cary
 * @date 2018年7月18日
 */
@SpringBootApplication
@MapperScan("com.mpri.aio.*.mapper,com.mpri.aio.system.shiro")
@EnableCaching
public class Application {
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}
