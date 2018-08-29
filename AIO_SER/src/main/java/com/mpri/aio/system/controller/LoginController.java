package com.mpri.aio.system.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.exception.ExceptionResult;
import com.mpri.aio.common.exception.UnauthorizedException;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.common.response.RestToken;
import com.mpri.aio.system.model.SysMenu;
import com.mpri.aio.system.model.SysRole;
import com.mpri.aio.system.model.SysUser;
import com.mpri.aio.system.service.SysMenuService;
import com.mpri.aio.system.service.SysRoleService;
import com.mpri.aio.system.service.SysUserService;
import com.mpri.aio.system.shiro.JWTUtil;
import com.mpri.aio.system.vo.MenuVo;

/**
 * 登陆控制器
 * @author Cary
 * @Date  2018年7月27日
 */

@RestController
public class LoginController extends BaseController {
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysRoleService sysRoleService;
	
	@Autowired
	private SysMenuService sysMenuService;
	
	//菜单根节点的父值定义为root
	private final String parentId="root";
	

	
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public RestResponse<RestToken> login(@RequestParam("username") String username,
            			@RequestParam("password") String password, 
            			@RequestParam("comeFrom")String comeFrom) {
	

		//首先校认验证码
        //if(true) {
    	SysUser sysUser=sysUserService.getSysUserByUsername(username);
		//确认用户是否存在
    	if(sysUser!=null) {
			//存在后处理
			//加盐处理密码
			String safeCode=sysUser.getSafecode();
			ByteSource salt = ByteSource.Util.bytes(safeCode);
			String result = new Md5Hash(password,salt,3).toString();
			
			//验证码获取
			//String severCode = (String)session.getAttribute("authCode");
	        //String clientCode = authCode;
    	
        	//登陆密码校验
    		if (sysUser.getPassword().equals(result)) {
    			//注册token
    			String token=JWTUtil.sign(username, result,comeFrom);
    			
    			//获取token过期时间
    			long tokenTime= JWTUtil.getTokenTime(token);
    			
    			//封装token
    			RestToken restToken=new RestToken();
    			restToken.setToken(token);
    			restToken.setTokenTime(tokenTime);
    			
                return new RestResponse<RestToken>(ExceptionResult.REQUEST_SUCCESS, "登陆成功！", restToken);
            } else {
                throw new UnauthorizedException("密码错误，请重新输入");
            }
    	
    	}else {
    		return new RestResponse<RestToken>(ExceptionResult.NO_PERMISSION, "用户名不存在，请重新输入！", null);
    	}
//    			
//        }else {
//        	return new RestResponse<RestToken>(ExceptionResult.NO_PERMISSION, "验证码错误！", null);
//        }
	}

	
	/**
	 * 首页初次加载菜单
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "refreshToken")
	public RestResponse<RestToken> refreshToken(@RequestParam("comeFrom")String comeFrom,HttpServletRequest request) {
		String token=request.getHeader("Authorization");
    	//当前时间
		Date now=new Date();
    	long nowTime=now.getTime();
    	//当前token过期时间
    	long tokenTime=JWTUtil.getTokenTime(token);
    	String username=JWTUtil.getUsername(token);
    	
    	long freshTime=0;

    	if(comeFrom.equals(JWTUtil.FROM_WEB)) {
    		freshTime=JWTUtil.REFESH_TIME;
    	}else if(comeFrom.equals(JWTUtil.FROM_APP)){
    		freshTime=JWTUtil.APP_REFESH_TIME;
    	}else {
    		freshTime=JWTUtil.REFESH_TIME;
    	}
    	
    	
    	//刷新token时间
    	if((tokenTime-nowTime)>0&(tokenTime-nowTime)<freshTime) {
    		SysUser sysUser=sysUserService.getSysUserByUsername(username);
    		String password=sysUser.getPassword();
    		
    		//注册new token
			String newToken=JWTUtil.sign(username, password,comeFrom);
			
			//获取token过期时间
			long newTokenTime= JWTUtil.getTokenTime(token);
			
			//封装token
			RestToken restToken=new RestToken();
			restToken.setToken(newToken);
			restToken.setTokenTime(newTokenTime);
			
            return new RestResponse<RestToken>(ExceptionResult.REQUEST_SUCCESS, "Token已刷新", restToken);
			
    	}else if((tokenTime-nowTime)<0){
    		return new RestResponse<RestToken>(ExceptionResult.REQUEST_SUCCESS, "Token已经过期，请重新登陆", null);
    	}else  {
    		//封装token
			RestToken restToken=new RestToken();
			restToken.setToken(token);
			restToken.setTokenTime(tokenTime);
    		return new RestResponse<RestToken>(ExceptionResult.REQUEST_SUCCESS, "token可以继续使用", restToken);
    	}
	}
	
	/**
	 * 首页初次加载菜单
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/index")
	public Map<String,Object> index(HttpServletRequest request) {
		
		String username = JWTUtil.getUsername(request.getHeader("Authorization"));
		
		Map<String,Object> userInfo=new HashMap<String,Object>();
		//获取用户对象
		SysUser sysUser = sysUserService.getSysUserByUsername(username);
		//获取角色
        List<SysRole> sysRoles = sysRoleService.loadRoleByUser(sysUser.getId());
		//获取菜单权限
        List<SysMenu> sysMenus = sysMenuService.loadMenuByUser(sysUser.getId());
        
        userInfo.put("user", sysUser);
        
        //处理空角色
        if(null!=sysRoles) {
        	userInfo.put("role", sysRoles);
        }
        
        //权限数据组织
        if(null!=sysMenus) {      	
        	userInfo.put("menu", installMenu(sysMenus,parentId));
        }
       
		return userInfo;
	}
	
	/**
	 * 首页初次加载权限按钮
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getPagePer")
	public List<SysMenu> getPagePer(String menuId,HttpServletRequest request) {
		
		String username = JWTUtil.getUsername(request.getHeader("Authorization"));
		//获取用户对象
		SysUser sysUser = sysUserService.getSysUserByUsername(username);
		
		List<SysMenu> sysmenus = sysMenuService.loadPagePer(sysUser.getId(), menuId);
		return sysmenus;
	}
	

	@GetMapping(path = "/401")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public RestResponse<String> unauthorized() {
        return new RestResponse<>(0, "Unauthorized", null);
    }
	
	/**
	 * 筛选组织menu
	 * @param menuList
	 * @return
	 */
	public MenuVo installMenu(List<SysMenu> menuList,String parentId) {
		
		MenuVo newMenu=new MenuVo();		
		//获取顶级菜单
		for(SysMenu menu:menuList) {
			if(menu.getParentId().equals(parentId)) {
				List<MenuVo> mvl=new ArrayList<>();
				newMenu.setId(menu.getId());
				newMenu.setName(menu.getName());
				newMenu.setCode(menu.getCode());
				newMenu.setIcon(menu.getIcon());
				newMenu.setHref(menu.getHref());
				newMenu.setType(menu.getType());
				newMenu.setParentId(menu.getParentId());
				newMenu.setPermission(menu.getPermission());
				//获取子对象
				newMenu.setChildren(getChildrenMenu(menu.getId(),menuList));
				mvl.add(newMenu);
				break;
			}
    	}
		return newMenu;
	}
	
	/**
     * 获取当前节点的所有子节点
     * @param nodeId
     * @param nodes
     * @return
     */
    public static List<MenuVo> getChildrenMenu(String menuId, List<SysMenu> menuList){
    	List<MenuVo> mvl=new ArrayList<>();
    	for (SysMenu menu : menuList) {
            if(menu.getParentId().equals(menuId)){
            	MenuVo newMenu=new MenuVo();
            	newMenu.setId(menu.getId());
            	newMenu.setName(menu.getName());
            	newMenu.setCode(menu.getCode());
            	newMenu.setIcon(menu.getIcon());
            	newMenu.setHref(menu.getHref());
            	newMenu.setType(menu.getType());
            	newMenu.setParentId(menu.getParentId());
            	newMenu.setPermission(menu.getPermission());
            	newMenu.setChildren(getChildrenMenu(menu.getId(),menuList));
            	mvl.add(newMenu);
            }else {
            	continue;
            }
           
        }
    	
        return mvl;
    }
	
	
}
