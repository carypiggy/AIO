package com.mprs.aio.system.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.mprs.aio.base.service.CrudService;
import com.mprs.aio.system.mapper.SysDictMapper;
import com.mprs.aio.system.model.SysDict;
/**
 *.系统编码业务类
 * @author xw
 * @date 2018年8月3日
 */
@Service
public class SysDictService extends CrudService<SysDictMapper, SysDict>  {

	/**
	 * .根据编码获取字典集
	 * @param typeCode
	 * @return
	 */
	public List<SysDict> getSysDictByTypecode(String typeCode) {
		
		SysDict sysDict = new SysDict();
		sysDict.setTypeCode(typeCode);
		return mapper.getSysDictByTypecode(sysDict);
	}
	

}