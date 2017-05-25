package com.scau.mis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Brand;
import com.scau.mis.service.BrandService;

/**
 * 品牌信息的controller
 * @author jodenhe
 *
 */
public class BrandController extends Controller {
	public static Log log = Log.getLog(BrandController.class);
	BrandService service = new BrandService();
	
	/**
	 * 增加一个品牌
	 */
	@RequiresPermissions("goods:brand:manage")
	public void add(){
		Brand brand = getModel(Brand.class);
		brand.setCreateTime(new Date());
		renderJson(service.addBrand(brand));
	}
	
	@RequiresPermissions("goods:brand:manage")
	public void delete() {
		Map<String, Object> result = new HashMap<String, Object>();
		long id = getParaToLong("id");
		try {
			if (service.delete(id)){
				result.put("status", true);
				result.put("msg", "操作成功！");
			}
			else{
				result.put("status", false);
				result.put("msg", "操作失败！");
			}
		} catch (Exception e) {
			result.put("status", false);
			result.put("msg", "该品牌已被使用，请先删除参照此品牌的商品！");
			log.warn(e+e.getMessage());
		}
		renderJson(result);
	}

	/**
	 * 更新品牌信息
	 */
	@RequiresPermissions("goods:brand:manage")
	public void update(){
		Brand brand = getModel(Brand.class);
		renderJson(service.updateBrand(brand));
	}
	
	/**
	 * 获取所有品牌信息
	 */
	public void getAllBrand(){
		renderJson(service.getAllBrand());
	}
	
	//验证名称是否存在
	public void validateName(){
		String name =getPara("name");
		if(null!=name&&name.length()>0){
			if(service.isExist(name)){
				renderJson(" {\"status\":true,\"msg\":\"名称已存在\"} ");
			}else{
				renderJson(" {\"status\":false,\"msg\":\"名称可用\"} ");
			}
		}else{
			renderJson(" {\"status\":true,\"msg\":\"名称不能为空\"} ");
		}
	}
}
