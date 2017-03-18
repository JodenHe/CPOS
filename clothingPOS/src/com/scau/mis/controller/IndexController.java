package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;

/**
 *配置前端页面
 * @author jodenhe
 *
 */
public class IndexController  extends Controller {
	public static Log log = Log.getLog(IndexController.class);

	/**
	 * 首页默认登录界面
	 */
	public void index() {
		log.info("进入首页登录界面");
		render("pages/login.html");
	}

	/**
	 * 系统管理员界面
	 */
	public void admin() {
		log.info("进入系统管理员界面");
		render("pages/index.html");
	}

	/**
	 * 收银员界面
	 */
	public void cashier() {
		log.info("进入收银员界面");
		render("pages/index2.html");
	}

	/**
	 * 仓库管理员界面
	 */
	public void warehouse() {
		log.info("仓库管理员界面");
		render("pages/index3.html");
	}
	
	/**
	 * 测试页面
	 */
	public void test() {
		log.info("测试页面");
		render("test.html");
	}
}
