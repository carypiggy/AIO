package com.mpri.aio.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.system.model.SysArea;
/**
 * 
 * @author lzw
 * @date 2018年8月3日
 */
@Mapper
public interface SysAreaMapper extends CrudMapper<SysArea>{
    /**
     * .根据code获取地区
     * @param sysArea
     * @return
     */
	SysArea getSysAreaByCode(SysArea sysArea);
	
	/**
	 * .根据父获取所有子
	 * @param sysArea
	 * @return
	 */
	List<SysArea> loadChildrenByParent(SysArea sysArea);
}