package com.mpri.aio.schoolmate.model;
import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 *  
 * @Description:  校友管理-校友表
 * @Author:       LZQ
 * @project       AIO   
 * @CreateDate:   Mon Aug 20 10:32:38 CST 2018
 * @Version:      v_1.0
 *    
 */
public class SmSchoolmate extends DataEntity<SmSchoolmate> {

	private static final long serialVersionUID = 1534732358165L;
	
	private String sysUserId;
	private String username;
	private String cardId;
	private String cardStatus;
	private String openid;
	private String name;
	private String pinyin;
	private String sex;
	private String truePhoto;
	private Date birthday;
	private String cardNum;
	private String cardType;
	private String type;
	private Integer level;
	private Integer point;
	private String nation;
	private Integer complete;
	private SmAddress smAddress;
	
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
	public String getCardId() {
		return this.cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}	
	public String getCardStatus() {
		return this.cardStatus;
	}
	public void setCardStatus(String cardStatus) {
		this.cardStatus = cardStatus;
	}	
	public String getOpenid() {
		return this.openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	public String getPinyin() {
		return this.pinyin;
	}
	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}	
	public String getSex() {
		return this.sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}	
	public String getTruePhoto() {
		return this.truePhoto;
	}
	public void setTruePhoto(String truePhoto) {
		this.truePhoto = truePhoto;
	}	
	public Date getBirthday() {
		return this.birthday;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}	
	public String getCardNum() {
		return this.cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}	
	public String getCardType() {
		return this.cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}	
	public String getType() {
		return this.type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public Integer getLevel() {
		return this.level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}	
	public Integer getPoint() {
		return this.point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}	
	public String getNation() {
		return this.nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}	
	public Integer getComplete() {
		return this.complete;
	}
	public void setComplete(Integer complete) {
		this.complete = complete;
	}	
	public Date getCreateDate() {
		return this.createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}	
}
