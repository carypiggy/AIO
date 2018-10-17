package com.mpri.aio.finance.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.finance.model.FinSalary;


 /**   
 *  
 * @Description:  薪资管理——DAO
 * @Author:       Cary
 * @project 	  aio 
 * @CreateDate:   Wed Oct 17 09:58:29 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface FinSalaryMapper extends CrudMapper<FinSalary>{

	
}