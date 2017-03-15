package com.scau.mis.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Page;
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

	/**
	 * 获取所有类别
	 * @return 封装在Map中的所有Category数据
	 */
	public Map<String, Object> selectAllCategory() {  
		Page<Category> page =Category.dao.paginate(1, 1000, "select *","from category order by `parentId` asc");
		List<Category> list = page.getList();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("datas", list);
		result.put("count", list.size());
		return result;
	}  
	
	/**
	 * 返回指定id的父类别
	 * @param id 指定的类别id
	 * @return 封装在List中的父Category数据
	 */
	public List<Category> selectParents(long id) {  
		String sql ="SELECT * FROM category WHERE id = '"+id+"' AND parentId!=null"; 
		List<Category> categorys = Category.dao.find(sql);
		List<Category> parents = new ArrayList<Category>();
		if(categorys!=null){
			parents.add(categorys.get(0));
			selectParents(categorys.get(0).getId());
			return parents;
		}
		return null;
	}  

	/**
	 * 根据id返回类别
	 * @param id 类别id
	 * @return 类别对象实例
	 */
	public Category selectCategory(long id) {  
		String sql ="select * from category where id = "+id; 
		List<Category> categorys = Category.dao.find(sql);
		if(categorys!=null){
			return categorys.get(0);
		}
		return null;
	}  

	/**
	 * 新增类别
	 * @param category 新增的类别对象实例
	 * @return 成功返回true，失败返回false
	 */
	public boolean insertCategory(Category category) {  
		if(!category.save()){
			return false;
		}
		return true;
	}  

	/**
	 * 修改类别信息
	 * @param category 要修改的类别对象
	 * @return 成功返回true，失败返回false
	 */
	public boolean updateCategory(Category category) {  
		if(!category.update()){
			return false;
		}
		return true;
	}  
}
