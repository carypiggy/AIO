 package com.mpri.aio.schoolmate.model;

import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

/**   
*  
* @Description:  校友管理-联系方式
* @Author:       LZQ
* @project       AIO   
* @CreateDate:   Tue Aug 21 11:21:24 CST 2018
* @Version:      v_1.0
*    
*/
public class SmContact extends DataEntity<SmContact> {

	private static final long serialVersionUID = 1534821684124L;
	
	private String sysUserId;
	private String username;
	private String type;
	private String contact;
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
	public String getType() {
		return this.type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public String getContact() {
		return this.contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}	
	public Date getCreateDate() {
		return this.createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}	

}
