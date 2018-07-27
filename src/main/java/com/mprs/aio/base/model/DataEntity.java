package com.mprs.aio.base.model;

import com.mprs.aio.common.utils.IdGen;

/**
 * 数据类
 * @author Cary
 * @Date  2018年7月27日
 * @param <T>
 */
public abstract class DataEntity<T> extends BaseEntity<T> {

	private static final long serialVersionUID = 1L;
	
	protected String remark;	// 备注
	protected String flag; 	// 删除标记（0：正常；1：删除；2：审核）
	
	
	/**
	 * 插入之前执行方法，需要手动调用
	 */
	@Override
	public void preInsert(){
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		if (!this.isNewRecord){
			setId(IdGen.uuid());
		}
	}
	
	/**
	 * 更新之前执行方法，需要手动调用
	 */
	@Override
	public void preUpdate(){

	}
	
	
	public DataEntity() {
		super();
		this.flag = "0";
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

}
