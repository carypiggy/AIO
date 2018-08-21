package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmContact;


 /**   
 *  
 * @Description:  校友管理-联系方式——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Tue Aug 21 11:21:24 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmContactMapper extends CrudMapper<SmContact>{

	
}