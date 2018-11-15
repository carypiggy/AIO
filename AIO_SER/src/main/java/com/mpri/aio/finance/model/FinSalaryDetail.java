package com.mpri.aio.finance.model;
import com.mpri.aio.base.model.DataEntity; 

 /**   
 *  
 * @Description:  薪资管理
 * @Author:       Cary
 * @project       aio   
 * @CreateDate:   Wed Oct 17 10:36:39 CST 2018
 * @Version:      v_1.0
 *    
 */
public class FinSalaryDetail extends DataEntity<FinSalaryDetail> {

	private static final long serialVersionUID = 1539743793931L;
	
	private String salaryId;
	private String card;
	private String name;
	private String email;
	private String status;
	private String path;

	
	public String getSalaryId() {
		return salaryId;
	}
	public void setSalaryId(String salaryId) {
		this.salaryId = salaryId;
	}
	public String getCard() {
		return this.card;
	}
	public void setCard(String card) {
		this.card = card;
	}	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	public String getEmail() {
		return this.email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
	public String getStatus() {
		return this.status;
	}
	public void setStatus(String status) {
		this.status = status;
	}	
	public String getPath() {
		return this.path;
	}
	public void setPath(String path) {
		this.path = path;
	}	

}
