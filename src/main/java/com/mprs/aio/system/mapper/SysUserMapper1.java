package com.mprs.aio.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mprs.aio.base.mapper.CrudMapper;
import com.mprs.aio.system.model.SysUser;

@Mapper
public interface SysUserMapper extends CrudMapper<SysUser> {    
    
    /**
     * 根据用户名获取用户
     * @return
     */
    SysUser getSysUserByUsername(String username);
}