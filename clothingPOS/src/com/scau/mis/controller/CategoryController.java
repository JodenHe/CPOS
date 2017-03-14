package com.scau.mis.controller;

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
	 * 添加一条类别信息
	 */
	public void add(){
		Category category = new Category();
		//TODO 接收前端传来的参数
		boolean result = service.addCategory(category);
		renderJson(result);
	}
}
