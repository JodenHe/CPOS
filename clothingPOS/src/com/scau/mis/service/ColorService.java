package com.scau.mis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.Brand;
import com.scau.mis.model.Color;

/**
 * 颜色信息的业务逻辑实现，废弃删除操作，颜色信息表只允许修改不能删除
 * 
 * @author jodenhe
 * 
 */
public class ColorService {
	public static Log log = Log.getLog(ColorService.class);

	/**
	 * 新增颜色
	 * 
	 * @param color
	 *            颜色信息
	 * @return map{"status" : true/false,"msg": 提示信息 }
	 */
	public Map<String, Object> addColor(Color color) {
		Map<String, Object> result = new HashMap<String, Object>();
		String name = color.getName();
		if (isExist(color.getName())) {
			result.put("status", false);
			result.put("msg", "颜色名称已存在！");
		} else {
			if (null != name && !"".equals(name)) {
				if (color.save()) {
					result.put("status", true);
					result.put("msg", "新增颜色成功！");
				} else {
					result.put("status", false);
					result.put("msg", "新增颜色失败，数据库未知错误！");
				}
			} else {
				result.put("status", false);
				result.put("msg", "颜色名称不能为空！");
			}
		}
		return result;
	}
	
	/**
	 * 删除
	 */
	public boolean delete(long id) throws Exception{
		if(Brand.dao.deleteById(id))
			return true;
		else
			return false;
	}

	/**
	 * 更新颜色
	 * 
	 * @param color
	 *            颜色信息
	 * @return map{"status" : true/false,"msg": 提示信息 }
	 */
	public Map<String, Object> updateColor(Color color) {
		Map<String, Object> result = new HashMap<String, Object>();
		String name = color.getName();
		if (isExist(color.getName(),color.getId())) {
			result.put("status", false);
			result.put("msg", "颜色名称已存在！");
		} else {
			if (null != name && !"".equals(name)) {
				if (color.update()) {
					result.put("status", true);
					result.put("msg", "更新颜色成功！");
				} else {
					result.put("status", false);
					result.put("msg", "更新颜色失败，数据库未知错误！");
				}
			} else {
				result.put("status", false);
				result.put("msg", "颜色名称不能为空！");
			}
		}
		return result;
	}

	/**
	 * 获得所有颜色类型
	 */
	public List<Color> getAllColor() {
		String allColor = "select * from color";
		return Color.dao.find(allColor);
	}

	/**
	 * 判断颜色是否存在（内部方法）
	 * 
	 * @param name
	 *            颜色名称
	 * @return 存在返回true，否则false
	 */
	public boolean isExist(String name) {
		String sql = "select `c`.`name` from `color` as `c`  where `c`.`name` = '"
				+ name + "'";
		return Color.dao.find(sql).size() > 0;
	}
	
	/**
	 * 判断颜色是否存在（内部方法）
	 * 
	 * @param name
	 *            颜色名称
	 * @return 存在返回true，否则false
	 */
	private boolean isExist(String name , long id) {
		String sql = "select `c`.`name` from `color` as `c`  where `c`.`name` = '"
				+ name + "' and `c`.`id` != " + id;
		return Color.dao.find(sql).size() > 0;
	}
}
