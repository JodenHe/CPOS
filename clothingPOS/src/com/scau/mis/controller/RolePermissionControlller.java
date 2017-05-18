package com.scau.mis.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.core.Controller;
import com.scau.mis.model.RolePermission;
import com.scau.mis.service.PermissionService;
import com.scau.mis.util.CommonUtil;

/**
 * 角色权限映射
 * @author jodenhe
 *
 */
public class RolePermissionControlller extends Controller{
	private PermissionService service = new PermissionService();

	/**
	 * 添加角色权限映射
	 */
	public void add(){
		String str = getPara("listPerId");
		long roleId = getParaToLong("roleId");
		//将前端的字符串如1,2,3转换为[1,2,3]的long型list
		List<Long> listPerId = CommonUtil.stringToLongList(str);
		List<RolePermission> rps = new ArrayList<RolePermission>();

		if (listPerId.size()>1) {
			for (Long perId : listPerId) {
				RolePermission rp = new RolePermission();
				rp.setPermissionId(perId);
				rp.setRoleId(roleId);
				rps.add(rp);
			}
			renderJson(service.setPerToRole(rps));
		}else{
			RolePermission rp = new RolePermission();
			rp.setPermissionId(listPerId.get(0));
			rp.setRoleId(roleId);
			renderJson(service.setPerToRole(rp));
		}
	}
}
