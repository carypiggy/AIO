package com.mpri.aio.pf;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
public class LettuceConTest {
	
//	@Autowired
//    private RedisTemplate<String, String> redisTemplate;
//	
//	@Autowired
//    private StringRedisTemplate stringRedisTemplate;
//	
//	
//    @Test
//    public void test() throws Exception {
//        List<String> list =new ArrayList<>();
//        list.add("a");
//        list.add("b");
//        list.add("v");
//        stringRedisTemplate.opsForValue().set("abc", "测试");
//        stringRedisTemplate.opsForList().leftPushAll("qq",list); // 向redis存入List
//        stringRedisTemplate.opsForList().range("qwe",0,-1).forEach(value ->{
//           System.out.println(value);
//        });
//    }
//	
//	 	
//
//
//    //@Test
//    public void set() {
//     
//    	redisTemplate.opsForValue().set("1", "2");
//    	
//    }
}
