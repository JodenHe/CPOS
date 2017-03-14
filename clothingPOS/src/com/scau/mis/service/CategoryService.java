package com.scau.mis.service;

import com.jfinal.log.Log;
import com.scau.mis.model.Category;

/**
 * 商品类别的业务逻辑实现
 * @author jodenhe
 *
 */
public class CategoryService {
	public static Log log = Log.getLog(CategoryService.class);
	/**
	 * 添加一个类别信息
	 * @param category 类别实例
	 * @return 成功添加返回true，失败返回false
	 */
	public boolean addCategory(Category category){
		if(!category.save()){
			return false;
		}
		return true;
	}
}
