package com.mprs.aio.base.dao;

import com.mprs.aio.base.model.SysUsers;

public interface SysUsersMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysUsers record);

    int insertSelective(SysUsers record);

    SysUsers selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysUsers record);

    int updateByPrimaryKeyWithBLOBs(SysUsers record);

    int updateByPrimaryKey(SysUsers record);
}