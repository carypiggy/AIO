package com.mpri.aio.common.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.mpri.aio.common.response.RestResponse;

/**
 * 全局异常处理类
 * @author Cary
 * @date 2018年8月6日
 */

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ResponseBody
    @ExceptionHandler(Exception.class)
    public RestResponse<Exception> handleException(Exception e) {
        return RestResponse.getInstance(ExceptionResult.NOT_FOUND, e.getMessage(), e);
    }
    
    
    // 捕捉UnauthorizedException 自定义401 异常
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(UnauthorizedException.class)
    public RestResponse<Exception> handle401() {
        return new RestResponse<Exception>(401, "Unauthorized", null);
    }

    
    // 捕捉其他所有异常
    //@ExceptionHandler(Exception.class)
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
