package com.mprs.aio.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.mprs.aio.base.mapper.CrudMapper;
import com.mprs.aio.base.model.DataEntity;
import com.mprs.aio.system.mapper.SysUserMapper;
import com.mprs.aio.system.model.SysUser;
import com.mprs.aio.system.service.SysUserService;

/**
* 用户信息接口实现
* @author Cary
* @date 2018年7月22日
*/
@Service
public class SysUserServiceImpl <M extends CrudMapper<SysUser>, T extends DataEntity<SysUser>> implements SysUserService  {
	
	@Autowired
	private SysUserMapper sysUserMapper;
	
	

	@Override
	public SysUser getSysUserByUsername(String username) {
		
		return sysUserMapper.getSysUserByUsername(username);
	}



	@Override
	public int addSysUsers(SysUser sysUsers) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int editSysUsers(SysUser sysUsers) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public SysUser getSysUser(String id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<SysUser> loadSysUsers() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Page<SysUser> findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}