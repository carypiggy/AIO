package com.mpri.aio;

import java.lang.reflect.Field;

import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * .主测试类
 * 
 * @author Cary
 * @date 2018年7月22日
 */

@RunWith(SpringRunner.class)
@SpringBootTest
//由于是Web项目，Junit需要模拟ServletContext，因此我们需要给我们的测试类加上@WebAppConfiguration。
@WebAppConfiguration
public class ApplicationTests {
	@Before
	public void init() {
		System.out.println("开始测试-----------------");
	}

	@After
	public void after() {
		System.out.println("测试结束-----------------");
	}

	public static <T> T outprint(String objName, Object obj) {
		try {
			Class<?> c = Class.forName(objName);
			Field[] fields = c.getDeclaredFields();
			for (Field f : fields) {
				f.setAccessible(true);
			}
			System.out.println("=============已经获取对象->" + objName + "===============");
			for (Field f : fields) {
				String field = f.toString().substring(f.toString().lastIndexOf(".") + 1); // 取出属性名称
				System.out.println("字段名："+field + " --> " + f.get(obj));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;

	}
}
