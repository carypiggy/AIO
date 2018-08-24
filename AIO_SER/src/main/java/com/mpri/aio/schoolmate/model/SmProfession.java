package com.mpri.aio.schoolmate.model;
import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 *  
 * @Description:  校友管理-校友职业经历
 * @Author:       LZQ
 * @project       AIO   
 * @CreateDate:   Mon Aug 20 10:57:39 CST 2018
 * @Version:      v_1.0
 *    
 */
public class SmProfession extends DataEntity<SmProfession> {

	private static final long serialVersionUID = 1534733859219L;
	
	private String sysUserId;
	private String username;
	private String workplace;
	private String nature;
	private String industry;
	private String department;
	private String position;
	private String telephone;
	private String fax;
	private Date startdate;
	private Date enddate;

	
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
	public String getWorkplace() {
		return this.workplace;
	}
	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}	
	public String getNature() {
		return this.nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}	
	public String getIndustry() {
		return this.industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}	
	public String getDepartment() {
		return this.department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}	
	public String getPosition() {
		return this.position;
	}
	public void setPosition(String position) {
		this.position = position;
	}	
	public String getTelephone() {
		return this.telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}	
	public String getFax() {
		return this.fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
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
