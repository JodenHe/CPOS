package com.scau.mis.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;

/**
 *系统管理员页面
 * @author jodenhe
 *
 */
public class AdminController  extends Controller {
	public static Log log = Log.getLog(AdminController.class);

	/**
	 * 系统管理员首页界面
	 */
	public void index() {
		log.info("进入系统管理员首页界面");
		render("index.html");
	}

	/**
	 * 系统管理员销售界面
	 */
	@RequiresPermissions("goods:sale")
	public void sale() {
		log.info("进入系统管理员销售下单界面");
		render("sale.html");
	}
	
	/**
	 * 系统管理员销售界面
	 */
	@RequiresPermissions("goods:sale2")
	public void goods() {
		log.info("进入系统管理员商品管理界面");
		render("goods.html");
	}
}
