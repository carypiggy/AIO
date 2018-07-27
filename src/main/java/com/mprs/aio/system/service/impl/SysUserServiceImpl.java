package com.mprs.aio.system.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mprs.aio.system.mapper.SysUserMapper;
import com.mprs.aio.system.model.SysUser;
import com.mprs.aio.system.service.SysUserService;

/**
* 用户信息接口实现
* @author Cary
* @date 2018年7月22日
*/
@Service
public class SysUserServiceImpl implements SysUserService  {
	
	@Autowired
	private SysUserMapper sysUserMapper;
	
	
	@Override
	public int addSysUsers(SysUser sysUser) {
		
		return sysUserMapper.insert(sysUser);
	}

	@Override
	public int editSysUsers(SysUser sysUser) {
		
		return sysUserMapper.updateByPrimaryKey(sysUser);
	}


	@Override
	public List<SysUser> loadSysUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SysUser getSysUser(String id) {
		return sysUserMapper.selectByPrimaryKey(id);
	}

	@Override
	public Page<SysUser> findByPage(int pageNo, int pageSize) {
		
		PageHelper.startPage(pageNo, pageSize);
		Page<SysUser> pageList=sysUserMapper.findByPage();
        return pageList;
	}

	@Override
	public SysUser getSysUserByUsername(String username) {
		
		return sysUserMapper.getSysUserByUsername(username);
	}
	
	

}