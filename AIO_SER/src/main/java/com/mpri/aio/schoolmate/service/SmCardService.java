package com.mpri.aio.schoolmate.service;

import org.springframework.stereotype.Service;
import com.mpri.aio.base.service.CrudService;
import com.mpri.aio.schoolmate.model.SmCard;
import com.mpri.aio.schoolmate.mapper.SmCardMapper;

 /**   
 *  
 * @Description:  校友卡管理——Service
 * @Author:       LZQ
 * @project 	  AIO 
 * @CreateDate:   Wed Aug 22 13:57:05 CST 2018
 * @Version:      v_1.0
 *    
 */
@Service
public class SmCardService extends CrudService<SmCardMapper, SmCard>  {


}