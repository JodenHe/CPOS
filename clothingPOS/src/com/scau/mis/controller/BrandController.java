package com.scau.mis.controller;

import java.util.Date;

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
	public void add(){
		Brand brand = getModel(Brand.class);
		brand.setCreateTime(new Date());
		renderJson(service.addBrand(brand));
	}

	/**
	 * 更新品牌信息
	 */
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
}
