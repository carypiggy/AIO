package ${daoUrl};
import org.apache.ibatis.annotations.Mapper;

import com.mpri.aio.base.mapper.CrudMapper;
import ${entityUrl}.${genTableInfo.entityName};


 /**   
 *  
 * @Description:  ${genTableInfo.entityComment}——DAO
 * @Author:       ${author}
 * @project 	  ${project} 
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
@Mapper
public interface ${genTableInfo.entityName}Mapper extends CrudMapper<${genTableInfo.entityName}>{

	
}