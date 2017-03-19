package com.scau.mis.service;

import com.jfinal.log.Log;
import com.scau.mis.model.Brand;

public class BrandService {
	public static Log log = Log.getLog(CategoryService.class);
	/**
	 * 增加一个品牌
	 */
	public boolean addBrand(Brand brand){
		if(brand.save())
			return true;
		else
			return false;
	}
	/**
	 * 通过id删除一个品牌
	 */
	public boolean deleteBrand(long id){
		if(Brand.dao.deleteById(id))
			return true;
		else
			return false;
	}
}
