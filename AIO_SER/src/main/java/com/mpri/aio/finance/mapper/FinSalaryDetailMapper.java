package com.mpri.aio.finance.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.finance.model.FinSalaryDetail;


 /**   
 *  
 * @Description:  薪资管理——DAO
 * @Author:       Cary
 * @project 	  aio 
 * @CreateDate:   Wed Oct 17 10:36:39 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface FinSalaryDetailMapper extends CrudMapper<FinSalaryDetail>{

	
}