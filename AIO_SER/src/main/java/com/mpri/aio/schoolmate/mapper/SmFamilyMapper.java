package com.mpri.aio.schoolmate.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.schoolmate.model.SmFamily;


 /**   
 *  
 * @Description:  校友管理-校友家庭成员——DAO
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Mon Aug 20 11:00:06 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SmFamilyMapper extends CrudMapper<SmFamily>{

	
}