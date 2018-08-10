package com.mpri.aio.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.system.model.SysLogs;

/**
 * 
 * @author Cary
 * @date 2018年8月6日
 */
@Mapper
public interface SysLogsMapper extends CrudMapper<SysLogs>{
    
}