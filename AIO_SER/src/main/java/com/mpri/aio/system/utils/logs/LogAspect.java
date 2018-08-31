package com.mpri.aio.system.utils.logs;
import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.mpri.aio.common.logs.Logs;
import com.mpri.aio.common.utils.HttpContextUtils;
import com.mpri.aio.common.utils.IPUtils;
import com.mpri.aio.system.model.SysLogs;
import com.mpri.aio.system.service.SysLogsService;


/**
 * 日志切面
 * @author syp
 * @date 2018年8月31日
 */
@Aspect
@Component
public class LogAspect {
    
    @Autowired
    private SysLogsService sysLogsService;
    
    // 定义Pointcut，Pointcut的名称 就是simplePointcut，此方法不能有返回值，该方法只是一个标示 
    // @annotation 指定自定义注解
    @Pointcut("@annotation(com.mpri.aio.common.logs.Logs)")
    public void logPointCut() {
       
    }
    
    @Before("logPointCut()")
    public void saveSysLogs(JoinPoint joinPoint) {
       MethodSignature signature = (MethodSignature) joinPoint.getSignature();
       Method method = signature.getMethod();

       SysLogs sysLogs = new SysLogs();
       Logs logs = method.getAnnotation(Logs.class);
       if(logs != null){
          //注解上的描述
           sysLogs.setMethod(logs.value());//保存获取的操作
           sysLogs.setType(logs.type());
       }
       
       //请求的参数
       Object[] args = joinPoint.getArgs();
       String params = JSON.toJSONString(args[0]);
       sysLogs.setParams(params);
       
       //获取request
       HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
       //设置IP地址
       sysLogs.setRemoteAddr(IPUtils.getIpAddr(request));
       
       sysLogs.setRequestUri(request.getRequestURI());
       //用户名
//       sysLogs.setUsername(request.getRemoteUser());
       
       //浏览器
       sysLogs.setUserAgent(request.getHeader("User-Agent"));
       //时间
       sysLogs.setCreateDate(new Date());
       //保存系统日志
       sysLogsService.save(sysLogs);
    }

    /*@AfterReturning(returning="rvt", pointcut="@annotation(com.cf.utils.annotation.SysLog)")
    public Object AfterExec(JoinPoint joinPoint,Object rvt){

    }*/
}
