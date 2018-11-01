package com.mpri.aio.finance.model;
import com.mpri.aio.base.model.DataEntity; 

 /**   
 *  
 * @Description:  薪资管理
 * @Author:       Cary
 * @project       aio   
 * @CreateDate:   Wed Oct 17 09:58:29 CST 2018
 * @Version:      v_1.0
 *    
 */
public class FinSalary extends DataEntity<FinSalary> {

	private static final long serialVersionUID = 1539741504255L;
	
	private String dateMonth;
	private Integer personNum;
	private String status;

	
	public String getDateMonth() {
		return this.dateMonth;
	}
	public void setDateMonth(String dateMonth) {
		this.dateMonth = dateMonth;
	}	
	public Integer getPersonNum() {
		return this.personNum;
	}
	public void setPersonNum(Integer personNum) {
		this.personNum = personNum;
	}	
	public String getStatus() {
		return this.status;
	}
	public void setStatus(String status) {
		this.status = status;
	}	

}
