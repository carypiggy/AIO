package com.mprs.aio.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mprs.aio.base.mapper.CrudMapper;
import com.mprs.aio.base.model.DataEntity;

/**
 * Service基类
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class CrudService<M extends CrudMapper<T>, T extends DataEntity<T>> extends BaseService {
	
	/**
	 * 持久层对象
	 */
	@Autowired
	protected M mapper;
	
	/**
	 * 根据id获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id) {
		return mapper.get(id);
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return mapper.get(entity);
	}
	
	/**
	 * 查询所有列表数据
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return mapper.loadAllList(entity);
	}
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<T> findPage(int pageNo, int pageSize,T entity) {
        PageHelper.startPage(pageNo, pageSize);
		Page<T> pageList=mapper.loadByPage(entity);	
		return pageList;
	}

	/**
	 * 保存数据（插入或更新）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void save(T entity) {
		if (entity.getIsNewRecord()){
			entity.preInsert();//自检插入id
			mapper.insert(entity);
		}else{
			entity.preUpdate();//自建，自定义操作扩展
			mapper.update(entity);
		}
	}
	
	/**
	 * 删除数据
	 * @param String
	 */
	@Transactional(readOnly = false)
	public void delete(String id) {
		mapper.delete(id);
	}

}