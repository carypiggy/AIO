package com.mpri.aio.system.vo;

import java.util.List;

/**
 * 支持 FormSelect的数据结构
 * @author Administrator
 *
 */
public class FormSelectDatas{

	private String value;
	
	private String parentId;
	
	private String name;
	
	private List<FormSelectDatas> children;

	
	public FormSelectDatas() {
		super();
	}

	


	public FormSelectDatas(String value, String parentId, String name) {
		super();
		this.value = value;
		this.parentId = parentId;
		this.name = name;
	}




	public String getParentId() {
		return parentId;
	}




	public void setParentId(String parentId) {
		this.parentId = parentId;
	}




	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<FormSelectDatas> getChildren() {
		return children;
	}

	public void setChildren(List<FormSelectDatas> children) {
		this.children = children;
	}




	@Override
	public String toString() {
		return "FormSelectDatas [value=" + value + ", name=" + name
				+ ", children=" + children + "]";
	}
	
	
	
}
