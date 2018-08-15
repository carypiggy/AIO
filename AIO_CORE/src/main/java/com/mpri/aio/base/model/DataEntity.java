package com.mpri.aio.base.model;

import java.util.Date;

import com.mpri.aio.common.utils.IdGen;

/**
 * 数据类
 * @author Cary
 * @Date  2018年7月27日
 * @param <T>
 */
public abstract class DataEntity<T> extends BaseEntity<T> {

	private static final long serialVersionUID = 1L;
	
	protected Date createDate;
	
	protected String remark;	// 备注
	protected String flag; 	// 删除标记（0：正常；1：删除；2：审核）
	
	//补充查询属性，不进行持久化，时间区间
	protected Date beginDate;
	protected Date endDate;
	
	
	public DataEntity() {
		super();
		//默认删除标记为正常
		this.flag = FLAG_NORMAL;
	}
	
	/**
	 * 插入之前执行方法，需要手动调用
	 */
	@Override
	public void preInsert(){
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		if (!this.isNewRecord){
			setId(IdGen.uuid());
			setCreateDate(new Date());
		}
	}
	
	/**
	 * 更新之前执行方法，需要手动调用
	 */
	@Override
	public void preUpdate(){

	}
	
	public DataEntity(String id) {
		super(id);
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

}
