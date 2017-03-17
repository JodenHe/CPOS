package com.scau.mis.service;

import java.util.ArrayList;
import java.util.List;

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

	/**
	 * 获取所有类别
	 * @return 封装在Map中的所有Category数据
	 */
	public List<Category> selectAllCategory2() {  
		String sql ="SELECT * FROM category ORDER BY `name` ASC"; 
		List<Category> categorys = Category.dao.find(sql);
		return categorys;
	}  
	
	/**
	 * 获取所有类别
	 * @return 封装在Map中的所有Category数据
	 */
	public List<Object> selectAllCategory() {  
		String sql ="SELECT * FROM category WHERE pId IS NULL ORDER BY `name` ASC"; 
		List<Category> list = Category.dao.find(sql);
		List<Object> lists = new ArrayList<Object>();
		if(list.size()>0){
			lists.add(list);
		}
		for (int i = 0; i < list.size(); i++) {
			if(getChildren(list.get(i).getId()).size()>0)
				lists.add(getChildren(list.get(i).getId()));
		}
		return lists;
	}  

	/**
	 * 返回指定id的父类别
	 * @param id 指定的类别id
	 * @return 封装在List中的父Category数据（包含原类别）
	 */
	public List<Category> selectParents(long id) {  
		String sql ="SELECT * FROM category WHERE id = "+id; 
		List<Category> categorys = Category.dao.find(sql);
		List<Category> parents = new ArrayList<Category>();

		if(categorys.size()>0){
			if (categorys.get(0).getPId()!=null) {
				parents.addAll(selectParents(categorys.get(0).getPId()));
			}
			parents.addAll(categorys);
		}
		return parents;
	}  

	/**
	 * 返回指定id的子类别
	 * @param id 指定的类别id
	 * @return 封装在List中的子Category数据
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getChildren(long id) {  
		String sql ="SELECT * FROM category WHERE pId = "+id; 
		List<Category> categorys = Category.dao.find(sql);
		List list = new ArrayList();

		if(categorys.size()>0){
			list.add(categorys);
			for (int i = 0; i < categorys.size(); i++) {
				if(getChildren(categorys.get(i).getId()).size()>0)
					list.add(getChildren(categorys.get(i).getId()));
			}
		}

		return list;
	}  

	/**
	 * 根据id返回类别
	 * @param id 类别id
	 * @return 类别对象实例
	 */
	public Category selectCategory(long id) {  
		String sql ="select * from category where id = "+id; 
		List<Category> categorys = Category.dao.find(sql);

		if(categorys.size()>0){
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
	/**
	 * 删除商品类别
	 */
	public boolean deleteCategory(long id){
			if(selectCategory(id).delete())
				return true;
			else
				return false;
	}
}
