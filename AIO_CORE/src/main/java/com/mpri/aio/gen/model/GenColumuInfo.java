package com.mpri.aio.gen.model;

/**
 * 
* <p>Title: GenColumuInfo</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年8月7日
 */
public class GenColumuInfo {

	//private static final long serialVersionUID = 123124L;
	/**
	 * 列名
	 */
	private String columnName;
	/**
	 * 列类型
	 */
	private String columnType;
	/**
	 * 列描述
	 */
	private String colComment;
	/**
	 * 类属性
	 */
	private String objProperty;
	/**
	 * 类属性 类型
	 */
	private String javaType;

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getColumnType() {
		return columnType;
	}

	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}

	public String getColComment() {
		return colComment;
	}

	public void setColComment(String colComment) {
		this.colComment = colComment;
	}

	public String getObjProperty() {
		return objProperty;
	}

	public void setObjProperty(String objProperty) {
		this.objProperty = objProperty;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

}
