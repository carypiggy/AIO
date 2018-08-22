package com.mpri.aio.schoolmate.model;

import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
*  
* @Description:  校友管理-教育经历
* @Author:       LZQ
* @project       AIO   
* @CreateDate:   Mon Aug 20 10:53:23 CST 2018
* @Version:      v_1.0
*    
*/
public class SmEducation extends DataEntity<SmEducation> {

	private static final long serialVersionUID = 1534733603868L;
	
	private String sysUserId;
	private String sysUserUsername;
	private String school;
	private String college;
	private String academy;
	private String series;
	private String specialty;
	private String className;
	private String degree;
	private String degreetype;
	private String studentid;
	private String schoollen;
	private Date startdate;
	private Date enddate;
	private Date createDate;

	
	public String getSysUserId() {
		return this.sysUserId;
	}
	public void setSysUserId(String sysUserId) {
		this.sysUserId = sysUserId;
	}	
	public String getSysUserUsername() {
		return this.sysUserUsername;
	}
	public void setSysUserUsername(String sysUserUsername) {
		this.sysUserUsername = sysUserUsername;
	}	
	public String getSchool() {
		return this.school;
	}
	public void setSchool(String school) {
		this.school = school;
	}	
	public String getCollege() {
		return this.college;
	}
	public void setCollege(String college) {
		this.college = college;
	}	
	public String getAcademy() {
		return this.academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}	
	public String getSeries() {
		return this.series;
	}
	public void setSeries(String series) {
		this.series = series;
	}	
	public String getSpecialty() {
		return this.specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}	
	public String getClassName() {
		return this.className;
	}
	public void setClassName(String className) {
		this.className = className;
	}	
	public String getDegree() {
		return this.degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}	
	public String getDegreetype() {
		return this.degreetype;
	}
	public void setDegreetype(String degreetype) {
		this.degreetype = degreetype;
	}	
	public String getStudentid() {
		return this.studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}	
	public String getSchoollen() {
		return this.schoollen;
	}
	public void setSchoollen(String schoollen) {
		this.schoollen = schoollen;
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
	public Date getCreateDate() {
		return this.createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}	

}
