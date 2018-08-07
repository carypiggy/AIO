package com.mprs.aio.system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mprs.aio.base.service.CrudService;
import com.mprs.aio.system.mapper.SysAreaMapper;
import com.mprs.aio.system.model.SysArea;

/**
* .地区CRUD实现
* @author lzq
* @date 2018年8月1日
*/
@Service
public class SysAreaService extends CrudService<SysAreaMapper, SysArea>  {	

	/**
	 * 根据code获取对象
	 * @return 
	 */
	public SysArea getSysAreaByCode(String code) {
		SysArea area = new SysArea();
		area.setCode(code);
		return mapper.getSysAreaByCode(area);
	}
	
	/**
	 * .根据父获取所有子
	 * @param sysArea
	 * @return
	 */
	List<SysArea> loadChildrenByParent(String id){
		SysArea area = new SysArea();
		area.setCode(id);
		return mapper.loadChildrenByParent(area);
	}
}