package com.mpri.aio.gen.model;
/**
 * 
* <p>Title: GenConfigInfo</p>  
* <p>Description: 生成配置相关</p>  
* @author syp  
* @date 2018年8月7日
 */
public class GenConfigInfo {
	//private static final long serialVersionUID = 123123L;
	/*
	 * 项目名称
	 */
	private String project;

	private String author;

	private String version;

	private String createTime;

	/*
	 * 生成的文件路径
	 */
	private String entityUrl;

	private String daoUrl;

	private String mapperUrl;

	private String serviceUrl;

	private String controllerUrl;

	private GenTableInfo genTableInfo;

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getEntityUrl() {
		return entityUrl;
	}

	public void setEntityUrl(String entityUrl) {
		this.entityUrl = entityUrl;
	}

	public String getDaoUrl() {
		return daoUrl;
	}

	public void setDaoUrl(String daoUrl) {
		this.daoUrl = daoUrl;
	}

	public String getMapperUrl() {
		return mapperUrl;
	}

	public void setMapperUrl(String mapperUrl) {
		this.mapperUrl = mapperUrl;
	}

	public String getServiceUrl() {
		return serviceUrl;
	}

	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
	}

	public String getControllerUrl() {
		return controllerUrl;
	}

	public void setControllerUrl(String controllerUrl) {
		this.controllerUrl = controllerUrl;
	}

	public GenTableInfo getGenTableInfo() {
		return genTableInfo;
	}

	public void setGenTableInfo(GenTableInfo genTableInfo) {
		this.genTableInfo = genTableInfo;
	}
}
