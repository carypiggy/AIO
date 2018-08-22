package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmExperience;


 /**   
 *  
 * @Description:  校友管理-校友表校园经历——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:56:04 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmExperienceMapper extends CrudMapper<SmExperience>{

	
}