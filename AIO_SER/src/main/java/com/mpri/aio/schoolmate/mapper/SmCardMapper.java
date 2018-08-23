package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmCard;


 /**   
 *  
 * @Description:  校友卡管理——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Wed Aug 22 13:57:05 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmCardMapper extends CrudMapper<SmCard>{

	
}