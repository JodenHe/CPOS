package com.scau.mis.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Role;
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
	
	/**
	 * 
	 * 添加角色
	 */
	@RequiresPermissions("per:role:create")
	public void add(){
		Role role = getModel(Role.class);
		if (service.addRole(role)) {
			renderJson(" {\"status\":true,\"msg\":\"添加成功！\"} ");
		}
		else{
			renderJson(" {\"status\":false,\"msg\":\"添加失败！\"} ");
		}
	}
	
	/**
	 * 删除角色
	 */
	@RequiresPermissions("per:role:delete")
	public void delete(){
		long id = getParaToLong("id");
		try {
			if(service.deleteRole(id)){
				renderJson(" {\"status\":true,\"msg\":\"成功删除角色！\"} ");
			}else{
				renderJson(" {\"status\":false,\"msg\":\"删除角色失败！\"} ");
			}
		} catch (Exception e) {
			log.warn(e+e.getMessage());
			renderJson(" {\"status\":false,\"msg\":\"无法删除角色，该角色分配了角色，请移除后删除！\"} ");
		}
	}

}
