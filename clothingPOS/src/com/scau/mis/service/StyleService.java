package com.scau.mis.service;

import java.util.List;

import com.jfinal.log.Log;
import com.scau.mis.model.Style;

public class StyleService {
	public static Log log = Log.getLog(StyleService.class);
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
	
	/**
	 * 获取所有款式对象
	 * @return List的款式对象
	 */
	public List<Style> getAllStyle(){
		String allColor = "select * from style";
		List<Style>  styles = Style.dao.find(allColor);
		return styles;
	}
}
