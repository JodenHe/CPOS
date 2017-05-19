package com.scau.mis.controller;


import java.util.Date;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Color;
import com.scau.mis.service.ColorService;

/**
 * 颜色的controller
 * @author jodenhe
 *
 */
public class ColorController extends Controller {
	public static Log log = Log.getLog(ColorController.class);
	private ColorService service = new ColorService();

	/**
	 * 添加一个颜色
	 */
	@RequiresPermissions("goods:color:manage")
	public void add(){
		Color color = getModel(Color.class);
		color.setCreateTime(new Date());
		renderJson(service.addColor(color));
	}
	
	/**
	 * 新增一个颜色
	 */
	@RequiresPermissions("goods:color:manage")
	public void update(){
		Color color = getModel(Color.class);
		renderJson(service.updateColor(color));
	}

	/**
	 * 获得所有颜色
	 */
	public void getAllColor(){
		renderJson(service.getAllColor());
	}
}
