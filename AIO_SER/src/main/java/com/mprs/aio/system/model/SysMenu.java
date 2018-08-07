package com.mprs.aio.system.model;

import com.mprs.aio.base.model.DataEntity;

/**
 * 
 * @author Cary
 * @date 2018年8月1日
 */
public class SysMenu extends DataEntity<SysMenu>{
   
    
	private static final long serialVersionUID = 1L;


	private String parentId;

   
    private String parentIds;

    
    private String name;

    
    private String code;

   
    private String href;

   
    private String icon;

  
    private String type;

 
    private String permission;

  
    private Long sort;

   
    private String target;

   
    private String isShow;

   
    public String getParentId() {
        return parentId;
    }

  
    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

   
    public String getParentIds() {
        return parentIds;
    }

  
    public void setParentIds(String parentIds) {
        this.parentIds = parentIds == null ? null : parentIds.trim();
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

   
    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href == null ? null : href.trim();
    }

    
    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

   
    public String getType() {
        return type;
    }

   
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

   
    public String getPermission() {
        return permission;
    }

   
    public void setPermission(String permission) {
        this.permission = permission == null ? null : permission.trim();
    }

  
    public Long getSort() {
        return sort;
    }

    public void setSort(Long sort) {
        this.sort = sort;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target == null ? null : target.trim();
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow == null ? null : isShow.trim();
    }

  
}