package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmAddress;


 /**   
 *  
 * @Description:  校友管理-校友地址管理——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:21:32 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmAddressMapper extends CrudMapper<SmAddress>{

	
}