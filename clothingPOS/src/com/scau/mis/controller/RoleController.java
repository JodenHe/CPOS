package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.service.RoleService;

public class RoleController  extends Controller{
	public static Log log = Log.getLog(RoleController.class);
	private RoleService service = new RoleService();
	
	/**
	 * 获取所有角色
	 */
	public void getAllRoles(){
		renderJson( service.getAllRoles() );
	}

}
