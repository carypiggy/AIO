package com.mprs.aio.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mprs.aio.base.mapper.SysUsersMapper;
import com.mprs.aio.base.model.SysUsers;
import com.mprs.aio.base.service.SysUsersService;

/**
* 用户信息接口实现
* @author Cary
* @date 2018年7月22日
*/
@Service
public class SysUsersServiceImpl implements SysUsersService  {
	
	@Autowired
	private SysUsersMapper sysUsersMapper;
	
	
	@Override
	public int addSysUsers(SysUsers sysUsers) {
		
		return sysUsersMapper.insert(sysUsers);
	}

	@Override
	public int editSysUsers(SysUsers sysUsers) {
		
		return sysUsersMapper.updateByPrimaryKey(sysUsers);
	}

	@Override
	public SysUsers getSysUsers(long id) {
		
		return sysUsersMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<SysUsers> loadSysUsers() {
		// TODO Auto-generated method stub
		return null;
	}

}
