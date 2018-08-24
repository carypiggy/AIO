package com.mpri.aio.schoolmate.model;

import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
*  
* @Description:  校友管理-校友表校园经历
* @Author:       LZQ
* @project       AIO   
* @CreateDate:   Mon Aug 20 10:56:04 CST 2018
* @Version:      v_1.0
*    
*/
public class SmExperience extends DataEntity<SmExperience> {

	private static final long serialVersionUID = 1534733764996L;
	
	private String sysUserId;
	private String username;
	private String organization;
	private String position;
	private Date startdate;
	private Date enddate;
	private Date createDate;

	
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
	public String getOrganization() {
		return this.organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}	
	public String getPosition() {
		return this.position;
	}
	public void setPosition(String position) {
		this.position = position;
	}	
	public Date getStartdate() {
		return this.startdate;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}	
	public Date getEnddate() {
		return this.enddate;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}	

}
