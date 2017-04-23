package com.scau.mis.config;


import com.jfinal.config.Routes;
import com.scau.mis.controller.AdminController;
import com.scau.mis.controller.CashierController;
import com.scau.mis.controller.IndexController;
import com.scau.mis.controller.WarehouseController;

/**
 * 前端路由配置
 * @author jodenhe
 *
 */
public class FrontRoutes extends Routes {

	@Override
	public void config() {
		add("/", IndexController.class);
		add("/admin", AdminController.class,"pages/admin");//管理员
		add("/cashier", CashierController.class,"pages/cashier");//收银员
		add("/warehouse", WarehouseController.class,"pages/warehouse");//收银员

	}

}
