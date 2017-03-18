package com.scau.mis.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseUserRole<M extends BaseUserRole<M>> extends Model<M> implements IBean {

	public void setId(java.math.BigInteger id) {
		set("id", id);
	}

	public java.math.BigInteger getId() {
		return get("id");
	}

	public void setUserId(java.math.BigInteger userId) {
		set("userId", userId);
	}

	public java.math.BigInteger getUserId() {
		return get("userId");
	}

	public void setRoleId(java.math.BigInteger roleId) {
		set("roleId", roleId);
	}

	public java.math.BigInteger getRoleId() {
		return get("roleId");
	}

}