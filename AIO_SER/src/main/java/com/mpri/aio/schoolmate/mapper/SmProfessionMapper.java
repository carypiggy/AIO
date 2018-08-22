package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmProfession;


 /**   
 *  
 * @Description:  校友管理-校友职业经历——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:57:39 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmProfessionMapper extends CrudMapper<SmProfession>{

	
}