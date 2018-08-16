package com.mpri.aio.system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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
import com.mpri.aio.common.exception.UnauthorizedException;
import com.mpri.aio.common.response.RestResponse;
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
	
	
	
	
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public RestResponse<String>  login(@RequestParam("username") String username,
            			@RequestParam("password") String password, 
            			@RequestParam("authCode")String authCode,HttpSession session) {
		
		SysUser sysUser=sysUserService.getSysUserByUsername(username);
		
		//加盐处理密码
		String safeCode=sysUser.getSafecode();
		ByteSource salt = ByteSource.Util.bytes(safeCode);
		String result = new Md5Hash(password,salt,3).toString();
		
		//验证码获取
		String severCode = (String)session.getAttribute("authCode");
        String clientCode = authCode;
        //首先校认验证码
        if(true) {
        	//登陆密码校验
    		if (sysUser.getPassword().equals(result)) {
                return new RestResponse<String>(0, "登陆成功！", JWTUtil.sign(username, result));
            } else {
                throw new UnauthorizedException();
            }
        	
        }else {
        	return new RestResponse<String>(1, "验证码错误！", null);
        }
	}
	
	private String parentId="root";
	
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
		//获取权限
        List<SysMenu> sysMenus = sysMenuService.loadPerByUser(sysUser.getId());
        
        userInfo.put("user", sysUser);
        userInfo.put("role", null);
        userInfo.put("menu", null);
        
        /**
         * 处理空角色
         */
        if(null!=sysRoles) {
        	userInfo.put("role", sysRoles);
        }
        
        /**
         * 权限数据组织
         */
        if(null!=sysMenus) {
        	
//        	//一级菜单集合
//        	List<MenuVo> pmList=new ArrayList<MenuVo>();
//        	
//        	//处理一级菜单
//        	for(SysMenu menu:sysMenus) {
//        		//判断菜单层级
//        		int menuLength=menu.getParentIds().split(",").length;
//        		
//        		//获取1级菜单（系统外一级，即实际数据二级）
//        		/**
//        		 * warning 此处的type类型需要使用系统变量重新标记
//        		 */
//        		if(menuLength==1&&menu.getType().equals("0")) {
//        			MenuVo pm=new MenuVo();
//        			pm.setCode(menu.getCode());
//        			pm.setName(menu.getName());
//        			
//        			pmList.add(pm);
//        		}
//        	}
//        	
//        	
        	
        	userInfo.put("firstMenu", installMenu(sysMenus,parentId));
        }
        
		return userInfo;
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

	
	
	@GetMapping(path = "/401")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public RestResponse<String> unauthorized() {
        return new RestResponse<>(0, "Unauthorized", null);
    }
	
	
	
	/**
	 * 测试add
	 */
	@RequestMapping(value = "/tsAdd", method = RequestMethod.GET)
	@RequiresPermissions("sys:add")
	public String tsAdd() {
		System.out.println("add");
		return "/index.html";
	}
	
	/**
	 * 测试add
	 */
	@RequestMapping(value = "/tsEdit", method = RequestMethod.GET)
	@RequiresPermissions("sys:edit")
	public String tsEdit() {
		System.out.println("edit");
		return "/index.html";
	}
	
	/**
	 * 测试add
	 */
	@RequestMapping(value = "/tsDel", method = RequestMethod.GET)
	@RequiresPermissions("sys:del")
	public String tsDel() {
		System.out.println("del");
		return "/index.html";
	}
	
}
