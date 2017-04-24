package com.scau.mis.controller;

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
