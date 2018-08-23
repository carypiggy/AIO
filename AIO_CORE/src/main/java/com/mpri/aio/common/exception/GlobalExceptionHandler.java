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
        return new RestResponse<ShiroException>(ExceptionResult.NO_PERMISSION, "您权限不足，请联系管理员，或重新登陆！", null);
    }
 

    
    // 捕捉UnauthorizedException 自定义401 异常
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(UnauthorizedException.class)
    public RestResponse<UnauthorizedException> handle401() {
        return new RestResponse<UnauthorizedException>(ExceptionResult.NO_PERMISSION, "账号或密码错误，请重新输入！", null);
    }
    
//    // 捕捉系统内部错误异常
//    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
//    public RestResponse<Exception> handle500(HttpServletRequest request, Throwable ex) {
//        return new RestResponse<Exception>(ExceptionResult.SYS_ERROR, "服务器内部错误，请检查网络或联系系统管理员！", null);
//    }
    
    
    // 捕捉其他所有异常
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestResponse<Exception> globalException(HttpServletRequest request, Throwable ex) {
        return new RestResponse<Exception>(getStatus(request).value(), "服务器内部错误，请检查网络或联系系统管理员！", null);
    }

    
    private HttpStatus getStatus(HttpServletRequest request) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if (statusCode == null) {
            return HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return HttpStatus.valueOf(statusCode);
    }

    
}
