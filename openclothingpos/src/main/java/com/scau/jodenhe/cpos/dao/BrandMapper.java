package com.scau.jodenhe.cpos.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.scau.jodenhe.cpos.entity.Brand;
import com.scau.jodenhe.cpos.plugins.mybatis.BaseMapper;

/**
 * 品牌dao
 * @author jodenhe
 * @create 2017年10月15日 下午7:29:47
 */
public interface BrandMapper extends BaseMapper<Brand> {
	
	/**
	 * 根据名字查询不是该id的对象
	 * @param name
	 * @param id
	 * @return List<Brand>
	 */
	List<Brand> selectListByNameNotId(@Param("name") String name, @Param("id") Long id);
}