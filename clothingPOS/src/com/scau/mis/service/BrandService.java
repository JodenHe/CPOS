package com.scau.mis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.Brand;
import com.scau.mis.model.Size;

/**
 * 品牌信息的业务逻辑实现，废弃删除操作，品牌信息表只允许修改不能删除
 * @author jodenhe
 *
 */
public class BrandService {
	public static Log log = Log.getLog(BrandService.class);

	/**
	 * 新增品牌
	 * @param brand 品牌信息
	 * @return  map{"status" : true/false,"msg": 提示信息 }
	 */
	public Map<String,Object> addBrand(Brand brand){
		Map<String,Object> result = new HashMap<String,Object>();
		String name = brand.getName();
		if (isExist(brand.getName())) {
			result.put("status", false);
			result.put("msg", "品牌名称已存在！");
		}
		else{
			if (null!=name&&"".equals(name)) {
				if (brand.save()) {
					result.put("status", true);
					result.put("msg", "新增品牌成功！");
				}
				else{
					result.put("status", false);
					result.put("msg", "新增品牌失败，数据库未知错误！");
				}
			}
			else{
				result.put("status", false);
				result.put("msg", "品牌名称不能为空！");
			}
		}
		return result;
	}

	/**
	 * 更新品牌信息
	 * @param brand 品牌信息
	 * @return  map{"status" : true/false,"msg": 提示信息 }
	 */
	public Map<String,Object> updateBrand(Brand brand){
		Map<String,Object> result = new HashMap<String,Object>();
		String name = brand.getName();
		if (isExist(brand.getName())) {
			result.put("status", false);
			result.put("msg", "品牌名称已存在！");
		}
		else{
			if (null!=name&&"".equals(name)) {
				if (brand.update()) {
					result.put("status", true);
					result.put("msg", "更新品牌成功！");
				}
				else{
					result.put("status", false);
					result.put("msg", "更新品牌失败，数据库未知错误！");
				}
			}
			else{
				result.put("status", false);
				result.put("msg", "品牌名称不能为空！");
			}
		}
		return result;
	}

	/**
	 * 获取所有的品牌信息
	 * @return 品牌list数组
	 */
	public List<Brand> getAllBrand(){
		String sql = "select * from brand";
		return Brand.dao.find(sql);
	}

	/**
	 * 判断品牌是否存在（内部方法）
	 * @param name 品牌名称
	 * @return 存在返回true，否则false
	 */
	private boolean isExist( String name){
		String sql = "select `b`.`name` from `brand` as `b`  where `b`.`name` = '"+name+"'";
		return Size.dao.find(sql).size()>0;
	}
}
