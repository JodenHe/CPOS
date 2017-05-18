package com.scau.mis.config;


import com.jfinal.config.Routes;
import com.scau.mis.controller.BrandController;
import com.scau.mis.controller.CategoryController;
import com.scau.mis.controller.ColorController;
import com.scau.mis.controller.GoodsController;
import com.scau.mis.controller.PermissionController;
import com.scau.mis.controller.RoleController;
import com.scau.mis.controller.RolePermissionControlller;
import com.scau.mis.controller.SaleController;
import com.scau.mis.controller.SaleOrderController;
import com.scau.mis.controller.SaleOrderItemController;
import com.scau.mis.controller.SaleRejectOrderController;
import com.scau.mis.controller.SaleRejectOrderItemController;
import com.scau.mis.controller.ShopController;
import com.scau.mis.controller.SizeController;
import com.scau.mis.controller.PaymentController;
import com.scau.mis.controller.UserController;

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
		add("/so",SaleOrderController.class);
		add("/soi",SaleOrderItemController.class);
		add("/sro",SaleRejectOrderController.class);
		add("/sroi",SaleRejectOrderItemController.class);
		add("/sale",SaleController.class);
		add("/pay",PaymentController.class);
		add("/user",UserController.class);
		add("/role",RoleController.class);
		add("/per",PermissionController.class);
		add("/rolePer",RolePermissionControlller.class);
	}

}
