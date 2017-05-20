package com.scau.mis.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;

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
	@RequiresPermissions("per:permission:divide")
	public void add(){
		String str = getPara("listPerId");
		long roleId = getParaToLong("roleId");

		//将前端的字符串如1,2,3转换为[1,2,3]的long型list

		List<RolePermission> rps = new ArrayList<RolePermission>();
		if (str.length()!=0) {
			List<Long> listPerId = CommonUtil.stringToLongList(str);
			for (Long perId : listPerId) {
				RolePermission rp = new RolePermission();
				rp.setPermissionId(perId);
				rp.setRoleId(roleId);
				rps.add(rp);
			}
		}

		renderJson(service.setPerToRole(rps,roleId));
	}
}
