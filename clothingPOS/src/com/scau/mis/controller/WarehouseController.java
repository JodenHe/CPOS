package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;

/**
 *仓库管理员页面
 * @author jodenhe
 *
 */
public class WarehouseController  extends Controller {
	public static Log log = Log.getLog(WarehouseController.class);

	/**
	 * 系统仓库管理员首页界面
	 */
	public void index() {
		log.info("进入仓库管理员界面");
		render("index.html");
	}

}
