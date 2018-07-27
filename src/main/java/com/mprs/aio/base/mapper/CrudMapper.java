package com.mprs.aio.base.mapper;

import java.util.List;

import com.github.pagehelper.Page;

/**
 * Mapper基础类实现
 * @author Cary
 * @Date  2018年7月27日
 * @param <T>
 */
public interface CrudMapper<T> extends BaseMapper{

	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id);
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity);
	
	/**
	 * 依据条件，分页查询数据列表
	 * @param entity
	 * @return
	 */
	public Page<T> loadByPage(T entity);
	
	/**
	 * 依据条件，查询所有数据列表
	 * @param entity
	 * @return
	 */
	public List<T> loadAllList(T entity);
	
	/**
	 * 查询所有数据列表
	 * @see public List<T> findAllList(T entity)
	 * @return
	 */
	public List<T> loadAllList();
	
	/**
	 * 插入数据
	 * @param entity
	 * @return
	 */
	public int insert(T entity);
	
	/**
	 * 更新数据
	 * @param entity
	 * @return
	 */
	public int update(T entity);
	
	/**
	 * 删除数据（一般为逻辑删除，更新flag字段为1）
	 * @param id
	 * @see public int delete(T entity)
	 * @return
	 */
	public int delete(String id);
	
	/**
	 * 删除数据（一般为逻辑删除，更新del_flag字段为1）
	 * @param entity
	 * @return
	 */
	public int delete(T entity);
	
}