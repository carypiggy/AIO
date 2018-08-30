package com.mpri.aio.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.system.model.SysUser;

/**
 * 用户信息mapper
 * @author Cary
 * @Date  2018年7月31日
 */
@Mapper
public interface SysUserMapper extends CrudMapper<SysUser>{
	/**
	 * 根据用户名获取用户
	 * @param username
	 * @return
	 */
    SysUser getSysUserByUsername(SysUser sysUser);
    
    /**
     * 插入用户和角色信息
    * <p>Title: insertUserRole</p>  
    * <p>Description: </p>  
    * @param sysUser
     */
    void insertUserRole(SysUser sysUser);
    
    /**
     * 删除用户关联角色
    * <p>Title: deleteUserRole</p>  
    * <p>Description: </p>  
    * @param sysUser
     */
    void deleteUserRole(SysUser sysUser);
    
    /**
     * 获取既有用户数
     * @param sysUser
     * @return
     */
    int getUserNum(SysUser sysUser);
    
}