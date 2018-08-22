package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmSchoolmate;


 /**   
 *  
 * @Description:  校友管理-校友表——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:32:38 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmSchoolmateMapper extends CrudMapper<SmSchoolmate>{

	
}