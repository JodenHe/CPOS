package com.scau.mis.service;

import java.util.List;

import com.jfinal.log.Log;
import com.scau.mis.model.Color;
import com.scau.mis.model.Size;

public class SizeService {
	public static Log log = Log.getLog(CategoryService.class);
	/**
	 * 增加一个尺码
	 */
	public boolean addSize(Size size){
		if(size.save())
			return true;
		else
			return false;
	}
	/**
	 * 通过类别获得一个尺码
	 */
	public List<Size> getSizeByName(String name){
		String sql = "select* from size where name='"+name+"'";
		List<Size> size =(List<Size>) Size.dao.find(sql);
		if(size.size()!=0)
			return size;
		else
			return null;
	}
	/**
	 * 通过id删除一个尺码
	 */
	public boolean deleteSize(long id){
		if(Size.dao.deleteById(id))
			return true;
		else
			return false;
	}

}
