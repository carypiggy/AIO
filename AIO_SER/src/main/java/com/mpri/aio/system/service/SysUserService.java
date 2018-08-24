package com.mpri.aio.system.service;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

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
	 * 根据用户名获取用户对象
	 * @param username
	 * @return
	 */
	@Cacheable(value = "userCache", key ="#username")
	public SysUser getSysUserByUsername(String username) {
		SysUser sysUser=new SysUser();
		sysUser.setUsername(username);
		return mapper.getSysUserByUsername(sysUser);
	}

    /**
     * 插入用户和角色信息
    * <p>Title: insertUserRole</p>  
    * <p>Description: </p>  
    * @param sysUser
     */
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
	public void deleteUserRole(SysUser sysUser) {
		mapper.deleteUserRole(sysUser);
	};

//	@Transactional(rollbackFor=Exception.class)
//	public void saveUsers(List<SysUser> userList) {
//		for(SysUser su:userList) {
//			mapper.insert(su);	
//		}
//		if (true) {
//	        throw new RuntimeException("save 抛异常了");
//	    }
//	}

}