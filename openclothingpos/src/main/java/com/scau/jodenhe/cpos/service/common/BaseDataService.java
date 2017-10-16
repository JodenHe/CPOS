package com.scau.jodenhe.cpos.service.common;

import java.util.List;

import com.scau.jodenhe.cpos.exception.CposException;
import com.scau.jodenhe.cpos.exception.NameAlreadyExitException;

/**
 * 基础数据service
 * @author jodenhe
 * @create 2017年10月16日 上午9:03:05
 */
public interface BaseDataService<T> {
	/**
	 * 获取所有的基础数据对象信息
	 * @return 基础数据list数组
	 */
	List<T> listData();
	
	/**
	 * 新增基础数据信息
	 * @param t 基础数据对象
	 * @return int 操作影响行数
	 * @throws CposException 内部异常
	 * @throws NameAlreadyExitException 名字已存在异常
	 */
	int save(T t) throws CposException, NameAlreadyExitException;
	
	/**
	 * 更新基础数据信息
	 * @param t 基础数据对象
	 * @return int 操作影响行数
	 * @throws CposException 内部异常
	 * @throws NameAlreadyExitException 名字已存在异常
	 */
	int update(T t) throws CposException, NameAlreadyExitException;
	
	/**
	 * 根据名字获取基础数据信息
	 * @param name 名字
	 * @return T 单个基础数据对象
	 */
	T getDataByName(String name);

	/**
	 * 根据名字判断是否存在
	 * @param name
	 * @return boolean
	 */
	boolean isExit(String name);
	
	/**
	 * 判断除了本id外名字是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean isExit(String name, Long id);
}
