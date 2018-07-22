package com.mprs.aio.base.mapper;

import com.mprs.aio.base.model.SysUsers;

public interface SysUsersMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysUsers record);

    int insertSelective(SysUsers record);

    SysUsers selectByPrimaryKey(long id);

    int updateByPrimaryKeySelective(SysUsers record);

    int updateByPrimaryKeyWithBLOBs(SysUsers record);

    int updateByPrimaryKey(SysUsers record);
}