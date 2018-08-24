package com.mpri.aio.system.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.github.pagehelper.PageInfo;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.common.utils.DateUtils;
import com.mpri.aio.common.utils.FileUtils;
import com.mpri.aio.common.utils.IdGen;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysUserService;
import com.mpri.aio.system.utils.UserUtils;



@RestController
@RequestMapping("/sys/sysuser")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserService sysUserService;
	
	/*初始没有身份证号的密码*/
	public static final String DEFAULT_PWD = "123456";
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
	@GetMapping(value = "/list")
	public PageInfo<SysUser> list(int pageNo,int pageSize,SysUser SysUser) {
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
	public String save(@RequestBody @Validated SysUser sysUser){
				
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
		return SUCCESS;
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
	public String delete(SysUser sysUser) {
		sysUserService.deleteUserRole(sysUser);
		sysUserService.delete(sysUser);
		return SUCCESS;
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
	public SysUser get(SysUser sysUser) {
		return sysUserService.get(sysUser);		
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
	public SysUser getSysUserByUsername(@RequestParam("username") String username) {
		return sysUserService.getSysUserByUsername(username);	
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
        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename(); 
        System.out.println(ClassLoader.getSystemResource(""));
//        System.out.println("fileName-->" + fileName);
//        System.out.println("getContentType-->" + contentType);
        String resfillPath  = DateUtils.getDate();
        String filePath = request.getSession().getServletContext().getRealPath(resfillPath+ "/");
        try {
            FileUtils.uploadFile(file.getBytes(), filePath, fileName);
            return RestResponse.getInstance(200, "上传成功", resfillPath +"/"+fileName);
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
