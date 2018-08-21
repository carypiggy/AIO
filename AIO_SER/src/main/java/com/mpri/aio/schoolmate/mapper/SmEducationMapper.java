package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmEducation;


 /**   
 *  
 * @Description:  校友管理-教育经历——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:53:23 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmEducationMapper extends CrudMapper<SmEducation>{

	
}