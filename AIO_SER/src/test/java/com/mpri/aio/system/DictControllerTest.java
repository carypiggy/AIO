package com.mpri.aio.system;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.mpri.aio.Application;

//@RunWith(SpringJUnit4ClassRunner.class)
//@SpringBootTest(classes = Application.class)
//@WebAppConfiguration
//public class DictControllerTest {
//	 private TestRestTemplate template = new TestRestTemplate();
//	    /**
//	     * @author PQF
//	     */
//	    @Test
//	    public void testMasterDataControllerQueryMasterDataByCode(){
//	    	 try {
//	    		 String url = "http://127.0.0.1:"+8080+"/sys/sysdict/get?id=4e2b2d221f3e4498bf3aed5304d099d8";     
//	    		 String result = template.getForObject(url, String.class);
//	    		 System.err.println(result);
//	    	 } catch (Exception e) {
//				e.printStackTrace();
//			}
//	    }
//
//}
