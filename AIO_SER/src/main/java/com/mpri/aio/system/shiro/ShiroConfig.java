package com.mpri.aio.system.shiro;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.DependsOn;
import org.springframework.web.filter.DelegatingFilterProxy;
/**
 * shiro 定义配置类
 * @author Cary
 * @date 2018年8月3日
 */
//@Configuration
public class ShiroConfig {
  
  /**
     * ShiroFilterFactoryBean 处理拦截资源文件问题。
     * 0、注意：单独一个ShiroFilterFactoryBean配置是或报错的，以为在初始化ShiroFilterFactoryBean的时候需要注入：SecurityManager
     *
		Filter Chain定义说明
       	1、一个URL可以配置多个Filter，使用逗号分隔
       	2、当设置多个过滤器时，全部验证通过，才视为通过
       	3、部分过滤器可指定参数，如perms，roles
     *
     */
    @Bean("shiroFilter")
    public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
    	//1.定义shiroFactoryBean
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        //2.设置securityManager
        shiroFilterFactoryBean.setSecurityManager(securityManager());
        //3.LinkedHashMap是有序的，进行顺序拦截器配置
        Map<String,String> filterChainDefinitionMap  = new LinkedHashMap<String,String>();
        //4.配置logout过滤器，退出过滤器,其中的具体的退出代码Shiro已经替我们实现了
        filterChainDefinitionMap.put("/doLogout", "logout");
        //5.设置默认通过的的url
        filterChainDefinitionMap.put("/captcha", "anon");
        filterChainDefinitionMap.put("/static/js/**", "anon");
        filterChainDefinitionMap.put("/login", "anon");
        //6.所有url必须通过认证才可以访问
//        filterChainDefinitionMap.put("/**", "authc");
        //7.设置成功之后要跳转的链接
        shiroFilterFactoryBean.setLoginUrl("/login");
        //8.设置未授权界面
        shiroFilterFactoryBean.setUnauthorizedUrl("/403");
        //9.设置shiroFilterFactoryBean的FilterChainDefinitionMap
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }
    
    /**
     * 配置安全管理器 
     * @return
     */
    @Bean
    public SecurityManager securityManager(){
        DefaultWebSecurityManager securityManager =  new DefaultWebSecurityManager();
        //设置realm,这里不设置的话会报错
        securityManager.setRealm(myShiroRealm());
        return securityManager;
    }
    
    
    @Bean
    public ShiroRealm myShiroRealm(){
        ShiroRealm myShiroRealm = new ShiroRealm();
        myShiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
        return myShiroRealm;
    }

    @Bean
    public FilterRegistrationBean<DelegatingFilterProxy> delegatingFilterProxy(){
        FilterRegistrationBean<DelegatingFilterProxy> filterRegistrationBean = new FilterRegistrationBean<DelegatingFilterProxy>();
        DelegatingFilterProxy proxy = new DelegatingFilterProxy();
        proxy.setTargetFilterLifecycle(true);
        proxy.setTargetBeanName("shiroFilter");
        filterRegistrationBean.setFilter(proxy);
        return filterRegistrationBean;
    }
    
    /**
     * .开启Shiro的注解(如@RequiresRoles,@RequiresPermissions),需借助SpringAOP扫描使用Shiro注解的类,并在必要时进行安全逻辑验证
     * .配置以下两个bean(DefaultAdvisorAutoProxyCreator(可选)和AuthorizationAttributeSourceAdvisor)即可实现此功能
     * @return
     */
    @Bean
    @DependsOn({"lifecycleBeanPostProcessor"})
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator(){
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(){
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager());
        return authorizationAttributeSourceAdvisor;
    }
    
    @Bean("lifecycleBeanPostProcessor")
    public static LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     * .密码匹配凭证管理器
     *
     * @return
     */
    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        // 采用MD5方式加密
        hashedCredentialsMatcher.setHashAlgorithmName("MD5");
        // 设置加密次数
        hashedCredentialsMatcher.setHashIterations(3);
        return hashedCredentialsMatcher;
    }
    
}
