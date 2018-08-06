package com.mprs.aio.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mprs.aio.base.mapper.CrudMapper;
import com.mprs.aio.system.model.SysLogs;

/**
 * 
 * @author Cary
 * @date 2018年8月6日
 */
@Mapper
public interface SysLogsMapper extends CrudMapper<SysLogs>{
    
}