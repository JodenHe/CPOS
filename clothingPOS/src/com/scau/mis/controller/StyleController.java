package com.scau.mis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Style;
import com.scau.mis.service.CategoryService;
import com.scau.mis.service.StyleService;

public class StyleController extends Controller {
	public static Log log = Log.getLog(CategoryService.class);
	StyleService styleService = new StyleService();
	/**
	 * 增加一个款式
	 */
	public void add(){
		Map<String,Object> result = new HashMap<String,Object>();
		Style style = new Style();
		long sizeId = getParaToLong("sizeId");
		long brandId = getParaToLong("brandId");
		long categoryId = getParaToLong("categoryId");
		String name = getPara("name");
		String script = getPara("script");
		if(!name.equals("")&&name!=null)
		{
			style.setBrandId(brandId);
			style.setCategoryId(categoryId);
			style.setSizeId(sizeId);
			style.setName(name);
			style.setScript(script);
			style.setCreateTime(new Date());
			if(styleService.addStlye(style))
				result.put("status", "添加成功");
			else
				result.put("status", "添加失败");
		}
		renderJson(result);
	}
	/**
	 * 通过id删除一个款式
	 */
	public void delete(){
		Map<String,Object> result = new HashMap<String,Object>();
		long id = getParaToLong("id");
		if(styleService.deleteStyle(id))
			result.put("status", "删除成功");
		else
			result.put("status", "删除失败");
		renderJson(result);
	}
}
