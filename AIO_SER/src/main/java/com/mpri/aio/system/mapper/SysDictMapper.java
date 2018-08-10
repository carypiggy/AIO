package com.mpri.aio.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.system.model.SysDict;

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