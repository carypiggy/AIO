package com.mpri.aio.system.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	
	@RequestMapping("/index/{name}")
    public String index(@PathVariable String name) {

        if (null == name) {
            name = "boy";
        }

        return "hello world " + name;
    }

    @RequestMapping("/tss/{age}")
    public String TestSSession(HttpServletRequest req, HttpServletResponse resp,@PathVariable String age){
    	req.getSession().setAttribute("age", age);
    	return age;
    }

    @RequestMapping("/tsg/{age}")
    @ResponseBody
    public String TestGSession(HttpServletRequest req, HttpServletResponse resp,@PathVariable String age){
        String a = (String) req.getSession().getAttribute("age");
        return a;
     
    }
}
