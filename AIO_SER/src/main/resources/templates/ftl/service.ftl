package ${serviceUrl};

import org.springframework.stereotype.Service;
import com.mpri.aio.base.service.CrudService;
import ${entityUrl}.${genTableInfo.entityName};
import ${daoUrl}.${genTableInfo.entityName}Mapper;

 /**   
 *  
 * @Description:  ${genTableInfo.entityComment}——Service
 * @Author:       ${author}
 * @project 	  ${project} 
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
@Service
public class ${genTableInfo.entityName}Service extends CrudService<${genTableInfo.entityName}Mapper, ${genTableInfo.entityName}>  {


}