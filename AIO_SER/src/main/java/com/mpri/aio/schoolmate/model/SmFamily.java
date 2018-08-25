package com.mpri.aio.schoolmate.model;
import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 *  
 * @Description:  校友管理-校友家庭成员
 * @Author:       LZQ
 * @project       AIO   
 * @CreateDate:   Mon Aug 20 11:00:06 CST 2018
 * @Version:      v_1.0
 *    
 */

public class SmFamily extends DataEntity<SmFamily> {

	private static final long serialVersionUID = 1534734006735L;
	
	private String sysUserId;
	private String username;
	private String name;
	private String sex;
	private Date birthday;
	private String relation;
	private String profession;
	private String phone;
	private String workplace;
	private String isschool;

	
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
	public String getSex() {
		return this.sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}	
	public Date getBirthday() {
		return this.birthday;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}	
	public String getRelation() {
		return this.relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}	
	public String getProfession() {
		return this.profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}	
	public String getPhone() {
		return this.phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	public String getWorkplace() {
		return this.workplace;
	}
	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}	
	public String getIsschool() {
		return this.isschool;
	}
	public void setIsschool(String isschool) {
		this.isschool = isschool;
	}		

}
