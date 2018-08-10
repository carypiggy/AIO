package com.mprs.aio.common.exception;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理类
 * @author Cary
 * @date 2018年8月6日
 */

@RestControllerAdvice
public class GlobalExceptionHandler {
	
	@ResponseStatus(value=HttpStatus.NOT_FOUND)  // 404
    @ExceptionHandler(Exception.class)
    public ExceptionResult<Exception> handleException(Exception e) {

        if (e instanceof NullPointerException) {
        	return ExceptionResult.getInstance(ExceptionResult.NOT_FOUND, "发生空指针异常", e);
        } else if (e instanceof IllegalArgumentException) {
        	return ExceptionResult.getInstance(ExceptionResult.NOT_FOUND, "请求参数类型不匹配", e);
        } else if (e instanceof SQLException) {
        	return ExceptionResult.getInstance(ExceptionResult.NOT_FOUND, "数据库访问异常", e);
        } else {
        	return ExceptionResult.getInstance(ExceptionResult.NOT_FOUND, "服务器代码发生异常,请联系管理员", e);
        }    	        
    }
}
