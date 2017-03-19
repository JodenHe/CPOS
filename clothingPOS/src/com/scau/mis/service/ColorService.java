package com.scau.mis.service;

import java.util.List;

import com.jfinal.log.Log;
import com.scau.mis.model.Color;

public class ColorService {
	public static Log log = Log.getLog(ColorService.class);
	/**
	 * 增加一个颜色
	 */
	public boolean addColor(Color color){
		if(color.save())
			return true;
		else
			return false;
	}
	/**
	 * 获得所有颜色类型
	 */
	public List<Color> getAllColor(){
		String allColor = "select * from color";
		List<Color>  color = Color.dao.find(allColor);
		return color;
	}
	/**
	 * 通过传入id 删除一个颜色
	 */
	public boolean deleteColor(long id){
		if(Color.dao.deleteById(id))
			return true;
		else
			return false;
	}
	/**
	 * 通过指定name获得特定颜色
	 */
	public List<Color> getColorByName(String name){
		String sql = "select * from color where name='"+name+"'";
		List<Color> aimColor = (List<Color>) Color.dao.find(sql);
		if(aimColor.size()!=0)
			return aimColor;
		else
			return null;
	}
}
