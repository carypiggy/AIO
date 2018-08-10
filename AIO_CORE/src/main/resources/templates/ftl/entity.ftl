 package ${entityUrl};
 /**   
 *  
 * @Description:  ${genTableInfo.entityComment}
 * @Author:       ${author}
 * @project       ${project}   
 * @CreateDate:   ${createTime}
 * @Version:      ${version}
 *    
 */
import com.mpri.aio.base.model.DataEntity; 
<#list genTableInfo.columuInfos as ci>
	<#if ci.javaType == "Date">
import java.util.Date;
	<#elseif ci.javaType == "Blob">
import java.sql.Blob;	
	</#if>
</#list>


public class ${genTableInfo.entityName} extends DataEntity<${genTableInfo.entityName}> {

	private static final long serialVersionUID = ${genTableInfo.agile}L;
	
<#list genTableInfo.columuInfos as ci>
	private ${ci.javaType} ${ci.objProperty};
</#list>

	
	<#list genTableInfo.columuInfos as ci>  
	public ${ci.javaType} get${ci.objProperty?cap_first}() {
		return this.${ci.objProperty};
	}
	public void set${ci.objProperty?cap_first}(${ci.javaType} ${ci.objProperty}) {
		this.${ci.objProperty} = ${ci.objProperty};
	}	
	</#list>

}
	