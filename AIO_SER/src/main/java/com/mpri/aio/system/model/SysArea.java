package com.mpri.aio.system.model;

import com.mpri.aio.base.model.DataEntity;

/**
 * .地区表
 * @author lzw
 * @date 2018年8月3日
 */
public class SysArea  extends DataEntity<SysArea>{
	
	private static final long serialVersionUID = 1L;

    private String parentId;

    private String parentIds;

    private String name;

    private Long sort;

    private String code;

    private String type;
    
    private SysArea parentSysArea;


	public SysArea getParentSysArea() {
		return parentSysArea;
	}

	public void setParentSysArea(SysArea parentSysArea) {
		this.parentSysArea = parentSysArea;
	}

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

    public Long getSort() {
        return sort;
    }

    public void setSort(Long sort) {
        this.sort = sort;
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