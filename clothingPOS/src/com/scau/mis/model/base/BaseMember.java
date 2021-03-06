package com.scau.mis.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseMember<M extends BaseMember<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Long id) {
		set("id", id);
	}

	public java.lang.Long getId() {
		return get("id");
	}

	public void setShopId(java.lang.Long shopId) {
		set("shopId", shopId);
	}

	public java.lang.Long getShopId() {
		return get("shopId");
	}

	public void setOperatorId(java.lang.Long operatorId) {
		set("operatorId", operatorId);
	}

	public java.lang.Long getOperatorId() {
		return get("operatorId");
	}

	public void setCustomerNo(java.lang.String customerNo) {
		set("customerNo", customerNo);
	}

	public java.lang.String getCustomerNo() {
		return get("customerNo");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setSex(java.lang.String sex) {
		set("sex", sex);
	}

	public java.lang.String getSex() {
		return get("sex");
	}

	public void setTelephone(java.lang.String telephone) {
		set("telephone", telephone);
	}

	public java.lang.String getTelephone() {
		return get("telephone");
	}

	public void setEmail(java.lang.String email) {
		set("email", email);
	}

	public java.lang.String getEmail() {
		return get("email");
	}

	public void setAddress(java.lang.String address) {
		set("address", address);
	}

	public java.lang.String getAddress() {
		return get("address");
	}

	public void setBirthday(java.util.Date birthday) {
		set("birthday", birthday);
	}

	public java.util.Date getBirthday() {
		return get("birthday");
	}

	public void setPassword(java.lang.String password) {
		set("password", password);
	}

	public java.lang.String getPassword() {
		return get("password");
	}

	public void setGrade(java.lang.String grade) {
		set("grade", grade);
	}

	public java.lang.String getGrade() {
		return get("grade");
	}

	public void setScript(java.lang.String script) {
		set("script", script);
	}

	public java.lang.String getScript() {
		return get("script");
	}

	public void setCreateTime(java.util.Date createTime) {
		set("createTime", createTime);
	}

	public java.util.Date getCreateTime() {
		return get("createTime");
	}

}
