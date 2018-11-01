package com.mpri.aio.system.service;

import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpri.aio.base.service.CrudService;
import com.mpri.aio.system.mapper.SysUserMapper;
import com.mpri.aio.system.model.SysUser;

/**
* 用户信息接口实现
* @author Cary
* @date 2018年7月22日
*/
@Service
public class SysUserService extends CrudService<SysUserMapper, SysUser>  {
	
	/**
	 * 保存用户信息的重写
	 * @param username
	 * @return
	 */
	@CachePut(value = "userCache", key ="#sysUser.username")
//	@CachePut(value = "userCache", key = "#sysUser.username", depict = "用户信息缓存",
//			firstCache = @FirstCache(expireTime = 5, timeUnit = TimeUnit.SECONDS),
//			secondaryCache = @SecondaryCache(expireTime = 10, preloadTime = 2, forceRefresh = true, timeUnit = TimeUnit.SECONDS))
	public SysUser save(SysUser sysUser) {
		super.save(sysUser);
		//反查对象并返回至缓存
		return mapper.getSysUserByUsername(sysUser);
	} 
	
	
	
	/**
	 * 根据用户名获取用户对象
	 * @param username
	 * @return
	 */
	@Cacheable(value = "userCache", key ="#username")
//	@Cacheable(value = "userCache", key ="#username", depict = "用户基础信息缓存",
//    firstCache = @FirstCache(expireTime = 10, timeUnit = TimeUnit.SECONDS),
//    secondaryCache = @SecondaryCache(expireTime = 15, preloadTime = 5, forceRefresh = true, timeUnit = TimeUnit.SECONDS))
	public SysUser getSysUserByUsername(String username) {
		SysUser sysUser=new SysUser();
		sysUser.setUsername(username);
		return mapper.getSysUserByUsername(sysUser);
	}

	/**
	 * 获取既有用户数
	 * @param username
	 * @return
	 */
	public int getUserNum(String username) {
		SysUser sysUser=new SysUser();
		sysUser.setUsername(username);
		return mapper.getUserNum(sysUser);
	}
    /**
     * 插入用户和角色信息
     * <p>Title: insertUserRole</p>  
     * <p>Description: </p>  
     * @param sysUser
     */
	@Transactional(readOnly = false)
	public void insertUserRole(SysUser sysUser) {
		mapper.deleteUserRole(sysUser);
		mapper.insertUserRole(sysUser);
	};
	
    /**
     * 删除用户和角色信息
     * <p>Title: insertUserRole</p>  
     * <p>Description: </p>  
     * @param sysUser
     */
	@Transactional(readOnly = false)
	public void deleteUserRole(SysUser sysUser) {
		mapper.deleteUserRole(sysUser);
	};

	/**
	 * 根据用户名获取密码
	 * @param username
	 * @return
	 */
	public SysUser getPwdByUsername(SysUser sysUser) {
		return mapper.getSysUserByUsername(sysUser);
	}

}