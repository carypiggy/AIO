package com.mprs.aio.gen.model;

import java.util.List;

/**
 * 
* <p>Title: GenTableInfo</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月7日
 */
public class GenTableInfo {
	/*
	 * 表名称
	 */
	private String table;
	/*
	 * 实体名称
	 */
	private String entityName;
	/*
	 * 对象名称
	 */
	private String objectName;
	/*
	 * 对象备注
	 */
	private String entityComment;

	/*
	 * 序列化
	 */
	private String agile;
	
	/*
	 * 列相信息
	 */
	private List<GenColumuInfo> columuInfos;

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getEntityComment() {
		return entityComment;
	}

	public void setEntityComment(String entityComment) {
		this.entityComment = entityComment;
	}

	public String getAgile() {
		return agile;
	}

	public void setAgile(String agile) {
		this.agile = agile;
	}

	public List<GenColumuInfo> getColumuInfos() {
		return columuInfos;
	}

	public void setColumuInfos(List<GenColumuInfo> columuInfos) {
		this.columuInfos = columuInfos;
	}
	
	
}
