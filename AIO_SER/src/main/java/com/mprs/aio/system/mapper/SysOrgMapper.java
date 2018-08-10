package com.mprs.aio.system.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.mprs.aio.base.mapper.CrudMapper;
import com.mprs.aio.system.model.SysOrg;


 /**   
 *  
 * @Description:  机构——DAO
 * @Author:       SYP
 * @project 	  AIO 
 * @CreateDate:   Wed Aug 08 17:21:42 CST 2018
 * @Version:      v_1.0
 *    
 */
@Mapper
public interface SysOrgMapper extends CrudMapper<SysOrg>{

	
}