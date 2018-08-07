package com.mprs.aio.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mprs.aio.base.mapper.CrudMapper;
import com.mprs.aio.system.model.SysDict;

/**
 * 
 * @author xw
 * @date 2018年8月3日
 */
@Mapper
public interface SysDictMapper extends CrudMapper<SysDict>{

	/**
	 * .根据typecode获取编码集合
	 * @param sysDict
	 * @return
	 */
	List<SysDict> getSysDictByTypecode(SysDict sysDict);
	
}