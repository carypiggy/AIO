package ${controllerUrl};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.common.exception.ExceptionResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.github.pagehelper.PageInfo;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
import ${entityUrl}.${genTableInfo.entityName};
import ${serviceUrl}.${genTableInfo.entityName}Service;

 /**   
 *  
 * @Description:  ${genTableInfo.entityComment}——Controller
 * @Author:       ${author}
 * @project 	  ${project} 
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
@RestController
@RequestMapping("/${requestUrl}/${genTableInfo.objectName}")
public class ${genTableInfo.entityName}Controller extends BaseController {
	
	@Autowired
	private ${genTableInfo.entityName}Service ${genTableInfo.objectName}Service;
		
	/**
	 * 获取${genTableInfo.entityComment}列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param ${genTableInfo.objectName}
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/list")
	public PageInfo<${genTableInfo.entityName}> list(int pageNo,int pageSize,${genTableInfo.entityName} ${genTableInfo.objectName}) {
		PageIo<${genTableInfo.entityName}> pageInfo =  ${genTableInfo.objectName}Service.loadByPage(pageNo,pageSize,${genTableInfo.objectName});							
		return pageInfo;
	}
	
	
	/**
	 * 增加或者更新${genTableInfo.entityComment}
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param ${genTableInfo.objectName}
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public RestResponse<String> save(@Validated ${genTableInfo.entityName} ${genTableInfo.objectName}){
		${genTableInfo.objectName}Service.save(${genTableInfo.objectName});
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "保存成功！", "");							
	}	
	
	/**
	 * 删除${genTableInfo.entityComment}（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param ${genTableInfo.objectName}
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public RestResponse<String> delete(${genTableInfo.entityName} ${genTableInfo.objectName}) {
		${genTableInfo.objectName}Service.delete(${genTableInfo.objectName});
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "删除成功！", "");
	}
	
	/**
	 * 获取${genTableInfo.entityComment}
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param ${genTableInfo.objectName}
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public RestResponse<${genTableInfo.entityName}> get(${genTableInfo.entityName} ${genTableInfo.objectName}) {
		return new RestResponse<${genTableInfo.entityName}>(ExceptionResult.REQUEST_SUCCESS, "获取成功！",
				${genTableInfo.objectName}Service.get(${genTableInfo.objectName}));	
	}
		
}