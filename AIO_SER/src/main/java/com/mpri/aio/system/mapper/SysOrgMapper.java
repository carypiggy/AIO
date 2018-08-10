package com.mpri.aio.system.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import com.mpri.aio.system.model.SysOrg;


 /**   
 *  
 * @Description:  机构——DAO
 * @Author:       SYP
 * @project 	  AIO 
 * @CreateDate:   Fri Aug 10 15:38:06 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SysOrgMapper extends CrudMapper<SysOrg>{

	
}