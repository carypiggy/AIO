package com.mprs.aio.common.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 全局异常处理类
 * @author Cary
 * @date 2018年8月6日
 */

@ControllerAdvice
public class GlobalExceptionHandler {
	
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ExceptionResult<Exception> handleException(Exception e) {
        return ExceptionResult.getInstance(ExceptionResult.NOT_FOUND, e.getMessage(), e);
    }
    
}
