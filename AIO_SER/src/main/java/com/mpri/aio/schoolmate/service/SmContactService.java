package com.mpri.aio.schoolmate.service;

import org.springframework.stereotype.Service;
import com.mpri.aio.base.service.CrudService;
import com.mpri.aio.schoolmate.model.SmContact;
import com.mpri.aio.schoolmate.mapper.SmContactMapper;

 /**   
 *  
 * @Description:  校友管理-联系方式——Service
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Tue Aug 21 11:21:24 CST 2018
 * @Version:      v_1.0
 *    
 */
@Service
public class SmContactService extends CrudService<SmContactMapper, SmContact>  {


}