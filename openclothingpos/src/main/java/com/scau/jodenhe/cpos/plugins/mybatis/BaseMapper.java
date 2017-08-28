package com.scau.jodenhe.cpos.plugins.mybatis;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * 
 * <p>Title: Mybatis基础DAO</p>
 * <p>Description: </p>
 * <p>Company: scau</p>
 * <p>Copyright: 1.0</p>
 * @author jodenhe
 * @version 1.0
 * @since 2017年8月28日 下午8:59:14
 * @param <T>
 */
public interface BaseMapper<T> {

	/**
	 * 通过ID查询
	 * 
	 * @param id
	 * @return
	 */
	Object selectById(Serializable id);

	/**
	 * 查询单条记录
	 * 
	 * @param entity
	 * @return
	 */
	Object selectOne(@Param("item") Object obj);

	/**
	 * 查询记录集合
	 * 
	 * @param entity
	 * @return
	 */
	List<?> selectList(@Param("item") Object obj);

	/**
	 * 分页查询
	 * 
	 * @param t
	 * @param page
	 * @return
	 */
	List<T> selectPage(@Param("item") Object obj, @Param("page") PageModel page);

	/**
	 * 通用的保存方法
	 * 
	 * @param <T>
	 * @param entity
	 */
	void save(@Param("item") Object obj);

	/**
	 * 批量保存
	 * 
	 * @param list
	 */
	int batchSave(List<?> list);

	/**
	 * 通用的修改方法
	 * 
	 * @param <T>
	 * @param entity
	 */
	int update(@Param("item") Object obj);

	/**
	 * 批量更新
	 * 
	 * @param list
	 * @return
	 */
	int batchUpdate(List<?> list);

	/**
	 * 删除方法
	 * 
	 * @param id
	 */
	int delById(Serializable id);

	/**
	 * 批量删除
	 * 
	 * @param list
	 * @return
	 */
	int delList(List<?> list);

	/**
	 * 批量删除方法
	 * 
	 * @param ids
	 */
	int delArray(int[] ids);

	/**
	 * 统计查询
	 * 
	 * @param <T>
	 * @param params
	 *            查询参数
	 * @return 总记录条数
	 */
	int count(Object obj);

}
