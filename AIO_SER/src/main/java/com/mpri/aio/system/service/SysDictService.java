package com.mpri.aio.system.service;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.mpri.aio.base.service.CrudService;
import com.mpri.aio.system.mapper.SysDictMapper;
import com.mpri.aio.system.model.SysDict;
/**
 *.系统编码业务类
 * @author xw
 * @date 2018年8月3日
 */
@Service
public class SysDictService extends CrudService<SysDictMapper, SysDict>  {

	/**
	 * 根据编码获取字典集
	 * @param typeCode
	 * @return
	 */
	@Cacheable(value = "dictCache", key ="#typeCode")
	public List<SysDict> getSysDictByTypecode(String typeCode) {
		SysDict sysDict = new SysDict();
		sysDict.setTypeCode(typeCode);
		return mapper.getSysDictByTypecode(sysDict);
	}
	

}