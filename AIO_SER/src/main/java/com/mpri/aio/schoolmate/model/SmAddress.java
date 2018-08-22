package com.mpri.aio.schoolmate.model;

import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

/**   
*  
* @Description:  校友管理-校友地址管理
* @Author:       LZQ
* @project       AIO   
* @CreateDate:   Mon Aug 20 10:21:32 CST 2018
* @Version:      v_1.0
*    
*/
public class SmAddress extends DataEntity<SmAddress> {

	private static final long serialVersionUID = 1534731692884L;
	
	private String sysUserId;
	private String username;
	private String ispost;
	private String country;
	private String province;
	private String city;
	private String district;
	private String detail;
	private String phone;
	private String zipcode;
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
	public String getIspost() {
		return this.ispost;
	}
	public void setIspost(String ispost) {
		this.ispost = ispost;
	}	
	public String getCountry() {
		return this.country;
	}
	public void setCountry(String country) {
		this.country = country;
	}	
	public String getProvince() {
		return this.province;
	}
	public void setProvince(String province) {
		this.province = province;
	}	
	public String getCity() {
		return this.city;
	}
	public void setCity(String city) {
		this.city = city;
	}	
	public String getDistrict() {
		return this.district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}	
	public String getDetail() {
		return this.detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}	
	public String getPhone() {
		return this.phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	public String getZipcode() {
		return this.zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}	
	public Date getCreateDate() {
		return this.createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}	

}
