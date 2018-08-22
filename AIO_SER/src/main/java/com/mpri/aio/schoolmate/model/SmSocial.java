 package com.mpri.aio.schoolmate.model;
import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 *  
 * @Description:  校友管理-校友政治兼职
 * @Author:       LZQ
 * @project       AIO   
 * @CreateDate:   Mon Aug 20 10:58:47 CST 2018
 * @Version:      v_1.0
 *    
 */
public class SmSocial extends DataEntity<SmSocial> {

	private static final long serialVersionUID = 1534733927398L;
	
	private String sysUserId;
	private String username;
	private String name;
	private String position;
	private String infoval;
	private Date startdate;
	private Date enddate;
	private String type;
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
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	public String getPosition() {
		return this.position;
	}
	public void setPosition(String position) {
		this.position = position;
	}	
	public String getInfoval() {
		return this.infoval;
	}
	public void setInfoval(String infoval) {
		this.infoval = infoval;
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
	public String getType() {
		return this.type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public Date getCreateDate() {
		return this.createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}	

}
