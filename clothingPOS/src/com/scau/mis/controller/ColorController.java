package com.scau.mis.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Color;
import com.scau.mis.service.ColorService;

public class ColorController extends Controller {
	public static Log log = Log.getLog(ColorController.class);
	private ColorService colorService = new ColorService();
	/**
	 * 添加一个颜色类别
	 */
	public void add(){
		Map<String,Object> result = new HashMap<String,Object>();
		Color color = new Color();
		String colorName = getPara("name");
		String colorScript = getPara("script");
		System.out.println(colorName);
		if(colorService.getColorByName(colorName)!=null){
			result.put("status", false);
		}else if(!colorName.equals("")&&colorName!=null){
			System.out.println(colorName);
			color.setName(colorName);
			color.setScript(colorScript);
			color.setCreateTime(new Date());
			if(colorService.addColor(color))
				result.put("status", true);
			else
				result.put("status", false);
		}else
			renderJson(result);

	}
	/**
	 * 通过id删除一个颜色类别
	 */
	public void delete(){
		Map<String,Object> result = new HashMap<String,Object>();
		long id = getParaToLong("id");
		if(colorService.deleteColor(id))
			result.put("status", true);
		else
			result.put("status", false);
		renderJson(result);
	}
	/**
	 * 获得所有颜色
	 */
	public void getAllColor(){
		Map<String,Object> result = new HashMap<String,Object>();
		List<Color> color = new ArrayList<Color>();
		color = colorService.getAllColor();
		result.put("data",color);
		renderJson(result);
	}
	/**
	 * 通过颜色名name获得指定颜色
	 */
	public void getColorById(){
		Map<String,Object> result = new HashMap<String,Object>();
		List<Color> color = new ArrayList<Color>();
		String name = getPara("name");
		color = colorService.getColorByName(name);
		if(color!=null)
			result.put("data", color);
		else
			result.put("data", "暂时没有该颜色");
		renderJson(result);
	}
}
