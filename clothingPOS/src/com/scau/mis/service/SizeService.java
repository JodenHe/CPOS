package com.scau.mis.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.Size;

/**
 * 尺码信息的业务逻辑实现，废弃删除操作，尺码信息表只允许修改不能删除
 * @author jodenhe
 *
 */
public class SizeService {
	public static Log log = Log.getLog(SizeService.class);

	/**
	 * 新增尺码信息
	 * @param size 尺码对象
	 * @return map{"status" : true/false,"msg": 提示信息 }
	 */
	public Map<String,Object> addSize(Size size){
		Map<String,Object> result = new HashMap<String,Object>();
		String name = size.getName();
		if(isExist(size.getType(), size.getName())){
			result.put("status", false);
			result.put("msg", "尺码信息已存在！");
		}
		else{
			if (null!=name && !"".equals(name)) {
				if (size.save()) {
					result.put("status", true);
					result.put("msg", "新增尺码成功！");
				}
				else{
					result.put("status", false);
					result.put("msg", "新增尺码失败，数据库未知错误！");
				}
			}
			else{
				result.put("status", false);
				result.put("msg", "尺码名称不能为空！");
			}
		}
		return result;
	}

	/**
	 * 新增更新尺码信息
	 * @param size 尺码对象
	 * @return map{"status" : true/false,"msg": 提示信息 }
	 */
	public Map<String,Object> updateSize(Size size){
		Map<String,Object> result = new HashMap<String,Object>();
		String name = size.getName();
		if(isExist(size.getType(), size.getName())){
			result.put("status", false);
			result.put("msg", "尺码信息已存在！");
		}
		else{
			if (null!=name && !"".equals(name)) {
				if (size.update()) {
					result.put("status", true);
					result.put("msg", "更新尺码成功！");
				}
				else{
					result.put("status", false);
					result.put("msg", "更新尺码失败，数据库未知错误！");
				}
			}
			else{
				result.put("status", false);
				result.put("msg", "尺码名称不能为空！");
			}
		}
		return result;
	}

	/**
	 * 获取尺寸表里面所有的类型信息
	 * @return
	 */
	public List<String> getSizeType(){
		String sql = "select distinct `s`.`type` from `size` as `s` ";
		List<String> list = new ArrayList<String>();
		List<Size> sizes = Size.dao.find(sql);
		for (Size size : sizes) {
			list.add(size.getType());
		}
		return list;
	}

	/**
	 * 通过尺码类型获得尺码
	 * @param type 尺码类型
	 * @return 
	 */
	public List<Size> getSizeByType(String type){
		String sql = "select * from size where type='"+type+"'";
		return Size.dao.find(sql);
	}

	/**
	 * 获取所有尺码
	 * @return 
	 */
	public List<Size> getAllSize(){
		String sql = "select * from size";
		return Size.dao.find(sql);
	}

	/**
	 * 判断尺码是否存在（内部方法）
	 * @param type 尺码类型
	 * @param name 尺码名称
	 * @return 存在返回true，否则false
	 */
	private boolean isExist(String type , String name){
		String sql = "select `s`.`name` from `size` as `s` where `s`.`type` = '"+type+"' and `s`.`name` = '"+name+"'";
		return Size.dao.find(sql).size()>0;
	}

}
