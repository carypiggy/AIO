package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmSocial;


 /**   
 *  
 * @Description:  校友管理-校友政治兼职——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 10:58:47 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmSocialMapper extends CrudMapper<SmSocial>{

	
}