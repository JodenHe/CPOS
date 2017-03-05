package com.scau.mis.config;


import com.jfinal.config.Routes;
import com.scau.mis.controller.IndexController;

/**
 * 前端路由配置
 * @author jodenhe
 *
 */
public class FrontRoutes extends Routes {

	@Override
	public void config() {
		add("/", IndexController.class);

	}

}
