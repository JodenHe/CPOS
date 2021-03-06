package com.scau.mis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import net.sf.json.JSONObject;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Category;
import com.scau.mis.service.CategoryService;

/**
 * 商品类别controller
 * 
 * @author jodenhe
 * 
 */
public class CategoryController extends Controller {
	public static Log log = Log.getLog(CategoryController.class);
	private CategoryService service = new CategoryService();

	/**
	 * 获取所有类别信息
	 */
	public void selectAllCategory() {
		renderJson(service.selectAllCategory2());
	}

	/**
	 * 获取第一级类别信息
	 */
	public void getFirstCategory() {
		renderJson(service.getFirstCategory());
	}

	/**
	 * 获取第二级类别信息
	 */
	public void getSecondCategory() {
		long pId = getParaToLong("pId");
		renderJson(service.getSecondCategory(pId));
	}

	/**
	 * 获取第三级类别信息
	 */
	public void getThirdCategory() {
		renderJson(service.getThirdCategory());
	}

	/**
	 * 获取指定id的所有父类别信息
	 */
	public void selectParents() {
		long id = getParaToLong("id");
		renderJson(service.selectParents(id));
	}

	/**
	 * 获取指定id的类别信息
	 */
	public void selectCategory() {
		long id = getParaToLong("id");
		renderJson(service.selectCategory(id) != null ? service
				.selectCategory(id) : JSONObject.fromObject("{}"));
	}

	/**
	 * 添加一条类别信息
	 */
	@RequiresPermissions("goods:category:manage")
	public void insert() {
		Category category = getModel(Category.class);
		category.setCreateTime(new Date());
		renderJson(service.addCategory(category));
	}

	/**
	 * 修改类别信息
	 */
	@RequiresPermissions("goods:category:manage")
	public void update() {
		Category category = getModel(Category.class);
		renderJson(service.updateCategory(category));
	}

	/**
	 * 查询是否拥有子目录
	 */
	public void getChildren() {
		Map<String, Object> result = new HashMap<String, Object>();
		long id = getParaToLong("id");
		if (service.getChildren(id).size() != 0) {
			result.put("status", true);
		} else {
			result.put("status", false);
		}
		renderJson(result);
	}

	/**
	 * 删除商品类别
	 */
	@RequiresPermissions("goods:category:manage")
	public void delete() {
		Map<String, Object> result = new HashMap<String, Object>();
		long id = getParaToLong("id");
		try {
			if (service.deleteCategory(id)){
				result.put("status", true);
				result.put("msg", "操作成功！");
			}
			else{
				result.put("status", false);
				result.put("msg", "该类别有子类别无法删除！");
			}
		} catch (Exception e) {
			result.put("status", false);
			result.put("msg", "该类别已被使用，请先删除参照此类别的商品！");
			log.warn(e+e.getMessage());
		}
		renderJson(result);
	}

	//验证名称是否存在
	public void validateName(){
		String name =getPara("name");
		if(null!=name&&name.length()>0){
			if(service.existCategory(name)){
				renderJson(" {\"status\":true,\"msg\":\"名称已存在\"} ");
			}else{
				renderJson(" {\"status\":false,\"msg\":\"名称可用\"} ");
			}
		}else{
			renderJson(" {\"status\":true,\"msg\":\"名称不能为空\"} ");
		}
	}
}
