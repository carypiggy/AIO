package com.mpri.aio.system.utils.logs;
import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.mpri.aio.common.logs.Logs;
import com.mpri.aio.common.utils.HttpContextUtils;
import com.mpri.aio.common.utils.IPUtils;
import com.mpri.aio.system.model.SysLogs;
import com.mpri.aio.system.service.SysLogsService;
import com.mpri.aio.system.shiro.JWTUtil;


/**
 * 日志切面
 * @author Cary
 * @date 2018年8月6日
 */
@Aspect
@Component
public class LogAspect {
	@Autowired
    private SysLogsService sysLogsService;
    
    @Pointcut("@annotation(com.mpri.aio.common.logs.Logs)")
    public void pointcut() { }
    
    
    @Around("pointcut()")
    public Object around(ProceedingJoinPoint point) {
        Object result = null;
        long beginTime = System.currentTimeMillis();
        try {
            // 执行方法
            result = point.proceed();
        } catch (Throwable e) {
            e.printStackTrace();
        }
        // 执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;
        // 保存日志
        saveLog(point, time);
        return result;
    }
    
    
	private void saveLog(ProceedingJoinPoint joinPoint, long time) {
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();

		SysLogs sysLogs = new SysLogs();
		Logs logs = method.getAnnotation(Logs.class);
		if (logs != null) {
			// 注解上的描述
			sysLogs.setMethod(logs.value());// 保存获取的操作
			sysLogs.setType(logs.type());
		}

		// 请求的参数
		Object[] args = joinPoint.getArgs();
		String params = JSON.toJSONString(args[0]);
		sysLogs.setParams(params);

		// 获取request
		HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
		// 设置IP地址
		sysLogs.setRemoteAddr(IPUtils.getIpAddr(request));

		sysLogs.setRequestUri(request.getRequestURI());
		// 用户名
		String token=request.getHeader("Authorization");
        sysLogs.setCreateBy(JWTUtil.getUsername(token));
		// 浏览器
		sysLogs.setUserAgent(request.getHeader("User-Agent"));
		// 时间
		sysLogs.setCreateDate(new Date());
	       //保存系统日志
		sysLogsService.save(sysLogs);
    }
}
