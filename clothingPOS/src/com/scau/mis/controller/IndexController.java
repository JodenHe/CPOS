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
	 * 首页默认登录界面
	 */
	public void login() {
		log.info("进入首页登录界面");
		render("pages/login.html");
	}
	
	/**
	 * 测试页面
	 */
	public void test() {
		log.info("测试页面");
		render("pages/index.html");
	}
	
	/**
	 * 认证未通过，或者权限不足
	 */
	public void unauthorized() {
		renderText("认证未通过，或者权限不足");
	}
}
