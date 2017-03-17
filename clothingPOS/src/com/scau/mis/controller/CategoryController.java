package com.scau.mis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Category;
import com.scau.mis.service.CategoryService;

/**
 * 商品类别controller
 * @author jodenhe
 *
 */
public class CategoryController extends Controller {

	public static Log log = Log.getLog(CategoryController.class);
	private CategoryService service = new CategoryService();

	/**
	 * 获取所有类别信息
	 */
	public void selectAllCategory(){
		renderJson(service.selectAllCategory2());
	}

	/**
	 * 获取指定id的所有父类别信息
	 */
	public void selectParents(){
		long id = getParaToLong("id");
		renderJson(service.selectParents(id));
	}

	/**
	 * 获取指定id的类别信息
	 */
	public void selectCategory(){
		long id = getParaToLong("id");
		renderJson(service.selectCategory(id)!=null?service.selectCategory(id):JSONObject.fromObject("{}"));
	}
	
	/**
	 * 添加一条类别信息
	 */
	public void insert(){
		Map<String, Object> result = new HashMap<String, Object>();
		Category category = new Category();
		String name = getPara("name");
		String script = getPara("script");

		if (name!=null&&!"".equals(name)) {
			category.setName(name);
			category.setScript(script);
			if (getParaToLong("parentId")!=null) {
				category.setPId(getParaToLong("pId"));
			}
			category.setCreateTime(new Date());
			boolean status = service.insertCategory(category);
			if (status) {
				result.put("data", "成功添加！");
				result.put("status", true);
			}
			else{
				result.put("data", "未知错误，添加失败！");
				result.put("status", false);
			}
		}
		else {
			result.put("data", "类别名称不能为空！");
			result.put("status", true);
		}
		renderJson(result);
	}

	/**
	 * 修改类别信息
	 */
	
	public void update(){
		Map<String, Object> result = new HashMap<String, Object>();
		Category category = new Category();
		long id = getParaToLong("id");
		String name = getPara("name");
		String script = getPara("script");

		if (name!=null&&!"".equals(name)) {
			category.setId(id);
			category.setName(name);
			category.setScript(script);
			if (getParaToLong("parentId")!=null) {
				category.setPId(getParaToLong("pId"));
			}
			category.setCreateTime(new Date());
			boolean status = service.updateCategory(category);
			if (status) {
				result.put("data", "成功修改！");
				result.put("status", true);
			}
			else{
				result.put("data", "未知错误，修改失败！");
				result.put("status", false);
			}
		}
		else {
			result.put("data", "类别名称不能为空！");
			result.put("status", true);
		}
		renderJson(result);
	}

	/**
	 * 查询是否拥有子目录
	 */
	public void getChildren(){
		
		Map<String, Object> result  =new HashMap<String, Object>();
		long id = getParaToLong("id");
		if(service.getChildren(id).size()!=0){
			result.put("status", true);
		}else{
			result.put("status", false);
		}
		renderJson(result);
	}
	/**
	 * 删除商品类别
	 */
	public void delete(){
		Map<String, Object> result  =new HashMap<String, Object>();
		long id = getParaToLong("id");
		if(service.deleteCategory(id))
			result.put("status", true);
		else
			result.put("status", false);
		renderJson(result);
	}
}
