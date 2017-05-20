package com.scau.mis.controller;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;

/**
 *收银员页面
 * @author jodenhe
 *
 */
public class CashierController  extends Controller {
	public static Log log = Log.getLog(CashierController.class);

	/**
	 * 首页默认界面
	 */
	@RequiresPermissions(value={"goods:sale","goods:reject"},logical=Logical.OR)
	public void index() {
		log.info("进入收银员首页界面");
		render("index.html");
	}

	/**
	 * 销售界面
	 */
	public void sale() {
		log.info("进入收银员销售界面");
		render("sale.html");
	}
}
