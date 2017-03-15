package com.scau.mis.config;


import com.jfinal.config.Routes;
import com.scau.mis.controller.CategoryController;

/**
 * 后端路由配置
 * @author jodenhe
 *
 */
public class AdminRoutes extends Routes {

	@Override
	public void config() {
		add("/category", CategoryController.class);
	}

}
