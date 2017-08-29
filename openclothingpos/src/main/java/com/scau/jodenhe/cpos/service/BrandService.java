package com.scau.jodenhe.cpos.service;

import java.util.List;

import com.scau.jodenhe.cpos.entity.Brand;
import com.scau.jodenhe.cpos.exception.CposException;
import com.scau.jodenhe.cpos.exception.NameAlreadyExitException;

/**
 * 
 * <p>Title: 品牌信息的业务逻辑接口</p>
 * <p>Description: </p>
 * <p>Company: scau</p>
 * <p>Copyright: 1.0</p>
 * @author jodenhe
 * @version 1.0
 * @since 2017年8月28日 下午9:51:49
 */
public interface BrandService {
	
	/**
	 * 获取所有的品牌信息
	 * @return 品牌list数组
	 */
	List<Brand> getAllBrand();
	
	/**
	 * 新增品牌信息
	 * @param brand
	 * @return int
	 * @throws CposException
	 * @throws NameAlreadyExitException
	 */
	int save(Brand brand) throws CposException, NameAlreadyExitException;
	
	/**
	 * 更新品牌信息
	 * @param brand 品牌信息
	 * @return int
	 * @throws CposException
	 * @throws NameAlreadyExitException
	 */
	int update(Brand brand) throws CposException, NameAlreadyExitException;
	
	/**
	 * 根据名字获取品牌信息
	 * @param name
	 * @return Brand
	 */
	Brand getBrandByName(String name);

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
	
