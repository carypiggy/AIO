package com.mpri.aio.system.model;

import java.util.ArrayList;
import java.util.List;

import com.mpri.aio.base.model.DataEntity;
/**
 * 
 * @author Cary
 * @Date  2018年7月31日
 */
public class SysRole extends DataEntity<SysRole>{

	private static final long serialVersionUID = 1L;

	private String name;

    private String code;
   
    private String type;
    
    private List<SysMenu> menuList = new ArrayList<SysMenu>();

    public List<SysMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    
    public String getCode() {
        return code;
    }
    
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

}