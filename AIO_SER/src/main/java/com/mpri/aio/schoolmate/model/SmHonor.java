package com.mpri.aio.schoolmate.model;
import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 *  
 * @Description:  校友管理-荣誉
 * @Author:       LZQ
 * @project       AIO   
 * @CreateDate:   Mon Aug 20 11:04:56 CST 2018
 * @Version:      v_1.0
 *    
 */

public class SmHonor extends DataEntity<SmHonor> {

	private static final long serialVersionUID = 1534734296911L;
	
	private String sysUserId;
	private String username;
	private String name;
	private String type;
	private Date date;
	private String domain;
	private String infoval;

	
	public String getSysUserId() {
		return this.sysUserId;
	}
	public void setSysUserId(String sysUserId) {
		this.sysUserId = sysUserId;
	}	
	public String getUsername() {
		return this.username;
	}
	public void setUsername(String username) {
		this.username = username;
	}	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	public String getType() {
		return this.type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public Date getDate() {
		return this.date;
	}
	public void setDate(Date date) {
		this.date = date;
	}	
	public String getDomain() {
		return this.domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}	
	public String getInfoval() {
		return this.infoval;
	}
	public void setInfoval(String infoval) {
		this.infoval = infoval;
	}	

}
