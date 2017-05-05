package com.scau.mis.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BasePermission<M extends BasePermission<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Long id) {
		set("id", id);
	}

	public java.lang.Long getId() {
		return get("id");
	}

	public void setPermissionName(java.lang.String permissionName) {
		set("permissionName", permissionName);
	}

	public java.lang.String getPermissionName() {
		return get("permissionName");
	}

	public void setPermissionSign(java.lang.String permissionSign) {
		set("permissionSign", permissionSign);
	}

	public java.lang.String getPermissionSign() {
		return get("permissionSign");
	}

	public void setDescription(java.lang.String description) {
		set("description", description);
	}

	public java.lang.String getDescription() {
		return get("description");
	}

}
