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
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Component;

import com.mpri.aio.common.logs.Logs;
import com.mpri.aio.common.utils.HttpContextUtils;
import com.mpri.aio.common.utils.IPUtils;
import com.mpri.aio.system.model.SysLogs;
import com.mpri.aio.system.service.SysLogsService;


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
        Logs logAnnotation = method.getAnnotation(Logs.class);
        if (logAnnotation != null) {
            // 注解上的描述
            sysLogs.setUserAgent(logAnnotation.value());
        }
        // 请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        sysLogs.setMethod(className + "." + methodName + "()");
        // 请求的方法参数值
        Object[] args = joinPoint.getArgs();
        // 请求的方法参数名称
        LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();
        String[] paramNames = u.getParameterNames(method);
        if (args != null && paramNames != null) {
            String params = "";
            for (int i = 0; i < args.length; i++) {
                params += "  " + paramNames[i] + ": " + args[i];
            }
            sysLogs.setParams(params);
        }
        // 获取request
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        // 设置IP地址
        sysLogs.setRemoteAddr(IPUtils.getIpAddr(request));
        // 模拟一个用户名
        sysLogs.setCreateBy("admin");
        sysLogs.setCreateDate(new Date());
        
        // 保存系统日志
        sysLogsService.save(sysLogs);
    }
}
