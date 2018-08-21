package com.mpri.aio.system.model;

import java.util.Date;

import com.mpri.aio.base.model.DataEntity;
/**
 * 
 * @author Cary
 * @date 2018年8月6日
 */
public class SysLogs extends DataEntity<SysLogs>{

	private static final long serialVersionUID = 1L;

	private String type;

    private String createBy;

    private Date createDate;

    private String remoteAddr;

    private String userAgent;

    private String requestUri;

    private String method;
    
    private String username;
    
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getCreateBy() {
        return createBy;
    }

    private String params;

    private String excContent;

    public String getParams() {
        return params;
    }
    public void setParams(String params) {
        this.params = params == null ? null : params.trim();
    }

    public String getExcContent() {
        return excContent;
    }
    public void setExcContent(String excContent) {
        this.excContent = excContent == null ? null : excContent.trim();
    }
    
    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getRemoteAddr() {
        return remoteAddr;
    }

    public void setRemoteAddr(String remoteAddr) {
        this.remoteAddr = remoteAddr == null ? null : remoteAddr.trim();
    }

    public String getUserAgent() {
        return userAgent;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent == null ? null : userAgent.trim();
    }

    public String getRequestUri() {
        return requestUri;
    }

    public void setRequestUri(String requestUri) {
        this.requestUri = requestUri == null ? null : requestUri.trim();
    }
    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method == null ? null : method.trim();
    }
}