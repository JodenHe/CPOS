package com.scau.mis.service;

import com.jfinal.log.Log;
import com.scau.mis.model.Style;

public class StyleService {
	public static Log log = Log.getLog(CategoryService.class);
	/**
	 * 增加一个款式
	 */
	public boolean addStlye(Style style){
		if(style.save())
			return true;
		else
			return false;
	}
	/**
	 * 通过id删除一个款式
	 */
	public boolean deleteStyle(long id){
		if(Style.dao.deleteById(id))
			return true;
		else
			return false;
	}
}
