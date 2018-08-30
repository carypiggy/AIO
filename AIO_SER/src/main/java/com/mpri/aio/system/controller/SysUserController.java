package com.mpri.aio.system.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.exception.ExceptionResult;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.common.utils.DateUtils;
import com.mpri.aio.common.utils.FileUtils;
import com.mpri.aio.common.utils.IdGen;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysUserService;



@RestController
@RequestMapping("/sys/sysuser")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserService sysUserService;
	
	/*初始没有身份证号的密码*/
	private static final String DEFAULT_PWD = "123456";
	/**
	 * 获取用户列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize
	* @param SysUser
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/list")
	public PageIo<SysUser> list(int pageNo,int pageSize,SysUser SysUser) {
		PageIo<SysUser> pageInfo =  sysUserService.loadByPage(pageNo,pageSize,SysUser);							
		return pageInfo;
	}
	
	/**
	 * 增加或者更新用户
	* <p>Title: add</p>  
	* <p>Description: </p>  
	* @param SysUser
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/save")
	public RestResponse<String> save(@RequestBody @Validated SysUser sysUser){
				
		if((null == sysUser.getId() && "".equals(sysUser.getId()))) {
			sysUser.setSafecode(IdGen.uuid());
			sysUser.setPassword(initPwd(sysUser.getIdcard()));
			ByteSource salt = ByteSource.Util.bytes(sysUser.getSafecode());
			//加盐炒三次safecode=salt
			String result = new Md5Hash(sysUser.getPassword(),salt,3).toString();
			sysUser.setPassword(result);
			sysUser.setCreateDate(new Date());
		}
		
		sysUserService.save(sysUser);
		sysUserService.insertUserRole(sysUser);
		RestResponse<String> rs= new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "保存成功！", "");
		
		return rs;
	}	
	
	/**
	 * 删除用户（逻辑删除）
	* <p>Title: delete</p>  
	* <p>Description: </p>  
	* @param SysUser
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/delete")
	public RestResponse<String> delete(SysUser sysUser) {
		sysUserService.deleteUserRole(sysUser);
		sysUserService.delete(sysUser);
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "删除成功！", "");

	}
	
	/**
	 * 根据id获取用户
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param id
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/get")
	public RestResponse<SysUser> get(SysUser sysUser) {
		return new RestResponse<SysUser>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", sysUserService.get(sysUser));	
	}
	
	/**
	 * 根据username获取用户
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param username
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/getusername")
	public RestResponse<String> getSysUserByUsername(@RequestParam("username") String username) {
		
		SysUser sysUser=sysUserService.getSysUserByUsername(username);
		if(null==sysUser) {
			return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "用户名不存在！", null);	
		}else {
			return new RestResponse<String>(ExceptionResult.DATA_USED, "用户名已经存在！", null);	
		}
		
	}
	
	/**
	 * 根据username获取用户
	* <p>Title: get</p>  
	* <p>Description: </p>  
	* @param username
	* @return
	 */
	@CrossOrigin
	@PostMapping(value = "/checkUserExist")
	public RestResponse<String> checkUserExist(@RequestParam("username") String username) {
		int userNum=sysUserService.getUserNum(username);
		if(userNum>0) {
			return new RestResponse<String>(ExceptionResult.DATA_USED, "用户名已经存在！", null);	
		}else {
			return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "用户名不存在！", null);	
		}
		
	}
	
	
	/**
	 * 文件图上传     
	* <p>Title: uploadImg</p>  
	* <p>Description: </p>  
	* @param file
	* @param request
	* @return
	 */
    @CrossOrigin
    @PostMapping(value = "/uploadimg")
    public RestResponse<String> uploadImg(@RequestParam("file") MultipartFile file,
            HttpServletRequest request) {
//        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename();
        String newFilName = String.valueOf(new Date().getTime())+"."+fileName.substring(fileName.lastIndexOf(".") + 1); /*更改文件名*/
        String resfillPath  = DateUtils.getDate();
        String filePath = request.getSession().getServletContext().getRealPath(resfillPath+ "/");
        try {
            FileUtils.uploadFile(file.getBytes(), filePath, newFilName);
            return RestResponse.getInstance(200, "上传成功", resfillPath +"/"+newFilName);
        } catch (Exception e) {
            // TODO: handle exception
        }      
        return RestResponse.getInstance(-1, "上传失败", resfillPath+fileName);
    }
    
    
	private String initPwd(String idCard) {
		if( null != idCard && idCard.length() > 6 ) {
			return idCard.substring(idCard.length()-6);
		}else {
			return DEFAULT_PWD;
		}
	}
}
