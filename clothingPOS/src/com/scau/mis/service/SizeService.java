package com.scau.mis.service;

import java.util.List;

import com.jfinal.log.Log;
import com.scau.mis.model.Size;

public class SizeService {
	public static Log log = Log.getLog(SizeService.class);
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
	 * 通过尺码类型获得尺码
	 * @param type 尺码类型
	 * @return 
	 */
	public List<Size> getSizeByType(String type){
		String sql = "select* from size where type='"+type+"'";
		return Size.dao.find(sql);
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
