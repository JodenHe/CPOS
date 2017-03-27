package com.scau.mis.config;


import com.jfinal.config.Routes;
import com.scau.mis.controller.BrandController;
import com.scau.mis.controller.CategoryController;
import com.scau.mis.controller.ColorController;
import com.scau.mis.controller.GoodsController;
import com.scau.mis.controller.ShopController;
import com.scau.mis.controller.SizeController;

/**
 * 后端路由配置
 * @author jodenhe
 *
 */
public class AdminRoutes extends Routes {

	@Override
	public void config() {
		add("/category", CategoryController.class);
		add("/color", ColorController.class);
		add("/brand",BrandController.class);
		add("/size",SizeController.class);
		add("/goods",GoodsController.class);
		add("/shop",ShopController.class);
	}

}
