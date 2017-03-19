package com.scau.mis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Brand;
import com.scau.mis.service.BrandService;
import com.scau.mis.service.CategoryService;

public class BrandController extends Controller {
	public static Log log = Log.getLog(CategoryService.class);
	BrandService brandService = new BrandService();
	/**
	 * 增加一个品牌
	 */
	public void add(){
		Map<String,Object> result = new HashMap<String,Object>();
		Brand brand = new Brand();
		long pId = getParaToLong("pId");
		String name = getPara("name");
		String script = getPara("script");
		if(!name.equals("")&&name!=null)
		{
			brand.setPId(pId);
			brand.setName(name);
			brand.setScript(script);
			brand.setCreateTime(new Date());
			if(brandService.addBrand(brand))
				result.put("status", "添加成功");
			else
				result.put("status", "添加失败");
		}
		renderJson(result);
	}
	/**
	 * 通过id删除一个品牌
	 */
	public void delete(){
		Map<String,Object> result = new HashMap<String,Object>();
		long id = getParaToLong("id");
		if(brandService.deleteBrand(id))
			result.put("status", "删除成功");
		else
			result.put("status", "删除失败");
		renderJson(result);
	}
}
