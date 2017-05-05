package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.service.PermissionService;

public class PermissionController  extends Controller{
	public static Log log = Log.getLog(PermissionController.class);
	private PermissionService service = new PermissionService();
	
	/**
	 * 获取所有权限信息
	 */
	public void getAllPers(){
		renderJson(service.getAllPers());
	}

}
