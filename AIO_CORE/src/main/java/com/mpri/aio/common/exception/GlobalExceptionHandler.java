package com.mpri.aio.common.exception;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.ShiroException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.mpri.aio.common.response.RestResponse;

/**
 * 全局异常处理类
 * @author Cary
 * @date 2018年8月6日
 */

@RestControllerAdvice
public class GlobalExceptionHandler {
	
	// 捕捉shiro的异常
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(ShiroException.class)
    public RestResponse<ShiroException> handle401(ShiroException e) {
        return new RestResponse<ShiroException>(401, e.getMessage(), null);
    }
 

    
    // 捕捉UnauthorizedException 自定义401 异常
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(UnauthorizedException.class)
    public RestResponse<UnauthorizedException> handle401() {
        return new RestResponse<UnauthorizedException>(401, "该账号密码无法登陆", null);
    }

    
    // 捕捉其他所有异常
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestResponse<Exception> globalException(HttpServletRequest request, Throwable ex) {
        return new RestResponse<Exception>(getStatus(request).value(), ex.getMessage(), null);
    }

    
    private HttpStatus getStatus(HttpServletRequest request) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if (statusCode == null) {
            return HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return HttpStatus.valueOf(statusCode);
    }

    
}
