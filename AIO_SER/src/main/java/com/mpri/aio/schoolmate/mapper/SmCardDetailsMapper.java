package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmCardDetails;


 /**   
 *  
 * @Description:  校友卡管理——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Wed Aug 22 13:58:54 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmCardDetailsMapper extends CrudMapper<SmCardDetails>{

	
}